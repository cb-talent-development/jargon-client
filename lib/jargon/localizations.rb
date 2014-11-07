module Jargon
  class Localizations < Jargon::Resource
    include Jargon::Helpers
    include Jargon::Locales

    def query(params = {})
      rejects_id
      client.get('/localizations', params)
    end

    def get
      expects_id
      client.get("/localizations/#{id}")
    end

    def save(localization)
      client.save('/localizations', localization)
    end

    def delete
      expects_id
      client.delete("/localizations/#{id}")
    end
  end
end
