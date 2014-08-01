require "socket"
require "json"

module Nexus

	class Channel

		attr_reader :remote_address
		attr_reader :last_local_address
		attr_reader :last_socket

		def initialize(options = {})
			@remote_address = Address.new(ip: options[:server_ip], port: options[:server_port])
		end

		def send(data = {})

			@last_socket = TCPSocket.new remote_address.ip, remote_address.port
			@last_local_address = Address.new(ip: @last_socket.local_address.ip_address, port: @last_socket.local_address.ip_port)

			request = Request.new(data)
			puts "[INFO] sending json data: #{request.serialize} to server: #{remote_address.ip} at #{remote_address.port}"

			last_socket.write request.serialize				

			while socket_response = last_socket.gets
				response = Response.from_json socket_response.chomp
				yield(response)
			end

			last_socket.close

			puts "[INFO] received response from server"	

		end 
			
	end

end

