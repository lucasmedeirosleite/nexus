require "socket"

module Nexus

	class Address

		attr_reader :ip, :port

		def initialize(options = {})
			@ip = options[:ip]
			@port = options[:port]
		end

	end

end

