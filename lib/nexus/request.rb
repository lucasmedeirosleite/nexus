require "json"

module Nexus

	class Request

		attr_accessor :controller
		attr_accessor :action
		attr_accessor :params

		def initialize(options = {})
			@controller = options[:controller]
			@action = options[:action]
			@params = options[:params]
		end

		def serialize
			{
				controller: controller,
				action: action,
				params: params
			}.to_json
		end

		def self.from_json(json)
			data = JSON.parse(json)
			Request.new(controller: data['controller'], action: data['action'], params: data['params'])
		end

	end

end

