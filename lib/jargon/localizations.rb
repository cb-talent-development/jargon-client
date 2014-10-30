module Jargon
  class Localizations < Jargon::Resource
    include Jargon::Locales

    def query(params = {})
      if id
        raise IdNotExpected
      else
        client.get('/localizations', params)
      end
    end

    def get
      if id
        client.get("/localizations/#{id}")
      else
        raise IdExpected
      end
    end

    def save(localization)
      client.save('/localizations', localization)
    end

    def delete
      if id
        client.delete("/localizations/#{id}")
      else
        raise IdExpected
      end
    end
  end
end
