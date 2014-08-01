require "socket"
require "json"

module Nexus

	DEFAULT_PORT = 2000

	class Server 
		
		attr_reader :port
		attr_reader :ip

		def initialize(port: DEFAULT_PORT)
			@ip = IPSocket.getaddress(Socket.gethostname)
			@port = port
		end

		def start
			puts "[INFO] starting server on #{ip} at port #{port}"
			begin
				
				Socket.tcp_server_loop(port) do |client|

					data = client.recv(1000)

					request = Request.from_json(data)

					puts "[INFO] server processing request with data: #{request.serialize}"

					if block_given?

						response = yield(request)
						client.write response.serialize	

					end

					client.close

					puts "[INFO] server processed request"

				end 

			rescue SystemExit, Interrupt
				puts ""
				puts "[INFO] stoping server on #{ip} at port #{port}"
			end
		
		end

	end

end

