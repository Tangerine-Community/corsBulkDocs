
if defined?(Rack::Utils)
    Rack::Utils.key_space_limit = 16000000
end

require "./corsBulkDocs.rb"
run Sinatra::Application
