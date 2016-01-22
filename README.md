# CORSbulkdocs

Sinatra application that batch processes file uploads from clients that use the CouchDB Replication API. 
It is tailored to handle some of the issues w/ CouchDB 1.2

## Configuration

Create file called config.rb:

    $host = "host"
    $login = "password"
    
## Installation

    gem install sinatra
    gem install sinatra-cross_origin 
    gem install sinatra-cookies  
    gem install sinatra-contrib
    
## Execution

Run start.sh. It logs to nohup.out.