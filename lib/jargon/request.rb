require 'ostruct'

module Jargon
  module Request
    def get(path, params = {})
      response = connection.get do |r|
        r.url base_url + path
        r.params = params
      end
      parse_response(response)
    end

    def post(path, params = {})
      response = connection.post do |r|
        r.url base_url + path
        r.body = params unless params.empty?
      end
      parse_response(response)
    end

    def put(path, params = {})
      response = connection.put do |r|
        r.url base_url + path
        r.body = params unless params.empty?
      end
      parse_response(response)
    end

    def delete(path)
      response = connection.delete do |r|
        r.url base_url + path
      end
      parse_response(response)
    end

    def save(path, model)
      model[:id] ? put("#{path}/#{model[:id]}", model) : post(path, model)
    end

    def parse_response(response)
      Jargon::Result.new(response.body, response.headers, response.status)
    end
  end
end
