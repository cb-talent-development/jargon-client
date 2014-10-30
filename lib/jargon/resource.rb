module Jargon
  class Resource
    def initialize(client, id)
      @client = client
      @id = id
    end

    protected
    attr_accessor :client, :id
  end
end
