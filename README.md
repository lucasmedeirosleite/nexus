# Nexus

This is a communication layer (based on TCP Sockets)

## Installation

Add this line to your application's Gemfile:

    gem 'nexus', :git => 'git@github.com:lucasmedeirosleite/nexus.git', :branch => 'master'

And then execute:

    $ bundle

## Usage

### Creating a server

To create a server with this communication library you can simply do:

```ruby

    require "nexus"
    
    # This will set a server on port 2000 by default (you can override the port with the argument 
    # port and its value in the constructor)
    server = Nexus::Server.new
    
    server.start do |request|
        
        # do your logic handling the request here
    
    end
```

The request format follows the MVC pattern, for example:

```ruby
    
    request.controller # returns a string containg a controller to be instatiated
    request.action # returns the desired action of the controller to be called
    request.params # returns the params to be passed to the desired action of the controller
```

Sending data to server

```ruby
	
	require 'nexus'

	channel = Nexus::Channel.new(server_ip: '192.168.123.12', server_port: 2000)

	channel.send(controller: 'HomeController', action: 'index', params: { message: 'Hello!' }) do |response|

		#handle response here

	end 

```

You must return on the start block an object of type Response, for example

```ruby
    
    Response.new(body: 'Return for the processed request')
```
