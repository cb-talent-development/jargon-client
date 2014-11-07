module Jargon
  class Users < Jargon::Resource
    def get
      if id
        client.get("/users/#{id}")
      else
        raise Jargon::Exceptions::IdExpected
      end
    end

    def save(user)
      client.save('/users', user)
    end
  end
end
