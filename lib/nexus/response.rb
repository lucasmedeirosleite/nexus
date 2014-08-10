require "json"

module Nexus

	class Response

		attr_accessor :body
		attr_accessor :success

		def initialize(body: "", success: true)
			@body = body
			@success = success
		end

		def serialize
			{ body: body, success: success }.to_json
		end

		def self.from_json(json)
			data = JSON.parse(json)
			Response.new(body: data['body'])
		end

	end

end

