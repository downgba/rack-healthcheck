module Rack
  module Healthcheck
    module Actions
      class Base
        class InvalidRequestMethod < RuntimeError; end

        VALID_REQUEST_METHODS = [:get].freeze

        attr_accessor :path, :request_method

        def initialize(path, request_method)
          method = request_method.downcase.to_sym
          raise InvalidRequestMethod, "Method not allowed" unless valid_request_method?(method)

          @path = path
          @request_method = method
        end

        protected

        def valid_request_method?(method)
          self.class::VALID_REQUEST_METHODS.include?(method)
        end
      end
    end
  end
end
