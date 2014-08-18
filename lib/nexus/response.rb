require "json"
require 'active_support/all'

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
			data = ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(json))
			data_body = ActiveSupport::HashWithIndifferentAccess.new(data[:body])
			Response.new(body: data_body)
		end

	end

end

