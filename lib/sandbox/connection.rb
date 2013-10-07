require "rest_client"

module Sandbox
  class Connection
    BASE_URL = "http://some-url.com/api/v1/containers"

    attr_reader :resp

    def create(params)
     # @resp = RestClient.post("#{BASE_URL}/create", params)
      self
    end

    def destroy(name)
      @resp = {errors: [{foo: "bar"}, {baz: "foo"}, {buzz: "bum"}]}
      # @resp = RestClient.delete("#{BASE_URL}/#{name}")
      self
    end

    def info(name)
      # @resp = RestClient.get("#{BASE_URL}/#{name}")
      self
    end

    def success?
      # resp[:result] === true
      false
    end

    def errors
      @resp[:errors] ||= []
    end
  end
end