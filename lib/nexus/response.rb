require "json"

module Nexus

	class Response

		attr_accessor :body

		def initialize(body: "")
			@body = body
		end

		def serialize
			{ body: body }.to_json
		end

		def self.from_json(json)
			data = JSON.parse(json)
			Response.new(body: data['body'])
		end

	end

end

