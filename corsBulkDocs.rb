# encoding: utf-8
#
# CorsBulkDocs
# Because we hate CouchDB 1.2.0.
##

require 'rubygems'
require 'sinatra'
require 'sinatra/cross_origin'
require "sinatra/cookies"
require "sinatra/reloader"
require 'rest-client'
require 'json'
require 'logger'
require './config.rb'

#
#
#

set :allow_origin, :any
set :allow_methods, [:get, :post, :options]
set :allow_credentials, true
set :max_age, "1728000"
set :protection, :except => :json_csrf

get "/" do
  {"error"=>true}.to_json
end

options "/*" do

  response.headers["Access-Control-Allow-Origin"] = "*"
  response.headers["Access-Control-Allow-Methods"] = "POST"
  response.headers["Access-Control-Allow-Headers"] = "Origin, Content-Type"

  halt 200

end

post "/:group" do | group |

  cross_origin

  #cookies[:AuthSession] = authenticate( user, pass )

  url = "http://#{$login}@#{$host}/#{group}/_bulk_docs"

  postData = request.body.read
  
  File.open( "temp", 'w' ) { |file| file.write( postData ) }

  data = `nodejs lz.js #{postData}`

  options = { :accept => :json,  :content_type => :json }

  response = RestClient.post(url, data, options)

  parsedResponse = JSON.parse response

  okCount = 0
  totalCount = parsedResponse.length || "X"

  for oneDocResponse in parsedResponse
    okCount += 1 if oneDocResponse['ok']
  end

  puts "#{okCount} ok of #{totalCount}"

  response

end


def authenticate (user, pass)

  data    = { :name => user, :password => pass }
  options = { :accept => :json,  :content_type => :json }

  puts "trying to login to #{$host}"
  res = RestClient::Resource.new("#{$host}/_session", user, pass)


  restResponse = res.post data.to_json, options

  sessionResponse = JSON.parse(restResponse)

  #generally, we just need to return the cookie. This login is only ever performed automatically.

  return restResponse.cookies["AuthSession"]

end
