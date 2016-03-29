# CORSbulkdocs

Sinatra application that batch processes file uploads from clients that use the CouchDB Replication API. 
It is tailored to handle some of the issues w/ CouchDB 1.2

## Configuration

Create file called config.rb:

    $host = "host"
    $login = "password"
    
## Installation

    bundle install
    
## Execution

Run start.sh. It logs to nohup.out.