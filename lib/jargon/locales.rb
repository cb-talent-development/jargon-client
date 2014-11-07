module Jargon
  module Locales
    def query_locales(params = {})
      expects_id
      client.get("/localizations/#{id}/locales", params)
    end

    def get_locale(locale_id)
      expects_id
      client.get("/localizations/#{id}/#{locale_id}")
    end

    def save_locale(locale)
      expects_id
      client.save("/localizations/#{id}", locale, '/locales')
    end

    def delete_locale(locale_id)
      expects_id
      client.delete("/localizations/#{id}/#{locale_id}")
    end
  end
end
