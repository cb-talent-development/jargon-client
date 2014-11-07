module Jargon
  module Helpers
    private
    def expects_id
      if !id
        raise Jargon::Exceptions::IdExpected
      end
    end

    def rejects_id
      if id
        raise Jargon::Exceptions::IdNotExpected
      end
    end
  end
end