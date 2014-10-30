module Jargon
  module Locales
    def query_locales(params = {})
      if id
        client.get("/localizations/#{id}/locales", params)
      else
        raise IdExpected
      end
    end

    def get_locale(locale_id)
      if id
        client.get("/localizations/#{id}/#{locale_id}")
      else
        raise IdExpected
      end
    end

    def save_locale(locale)
      client.save("/localizations/#{id}/locales", locale)
    end

    def delete_locale(locale_id)
      if id
        client.delete("/localizations/#{id}/#{locale_id}")
      else
        raise IdExpected
      end
    end
  end
end
