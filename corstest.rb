# encoding: utf-8
#
# CorsTest
##

require 'rubygems'
# require "base64"
require "Open3"

postData = ""

# data = `node lz.js -d #{postData}`
#stdin, stdout, stderr = Open3.popen3('node lz.js -d #{postData}')
#puts stdout.gets

cmd = 'node lz.js -d ' + postData
data = ""
Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
  data = stdout.read
  if stdout.read != ''
    puts "stderr is:" + stderr.read
  end
end

puts "data: " + data

#encoded = Base64.encode64("Now is the time for all good coders\nto learn Ruby")
#puts encoded
#decoded = Base64.decode64(encoded)
#puts decoded

# decode_base64_content = Base64.urlsafe_decode64(postData)
#puts decode_base64_content
