# jargon-client

[![Build Status](https://travis-ci.org/cb-talent-development/jargon-client.svg)](https://travis-ci.org/cb-talent-development/jargon-client)

Ruby client library for [Jargon](https://github.com/cb-talent-development/jargon)'s API. Inspired by [cortex-client](https://github.com/cb-talent-development/cortex-client).

## Constructor

```ruby
require 'jargon-client'

client = Jargon::Client.new(access_token: 'access_token')

client.localizations.query.each do |localization|
  puts localization
end
```

Alternatively, jargon-client will handle OAuth2 authentication for you:

```ruby
require 'jargon-client'

client = Jargon::Client.new(key: 'my-app-id', secret: 'secrey-key-ssh', base_url: 'base_url')
 
puts client.localizations(id).get
puts client.users(id).get
```

## Localizations/Locales

The `Locale` resource does not work quite like the `Localization` resource. In order to work with Locale, utilize the `Locales` methods mixed into the `Localization` class, so long as you have provided a Localization ID. Example:

```ruby
client.localizations(id).query_locales
client.localizations(id).get_locale(locale_id)
```

## Result object

Jargon::Client will return a Jargon::Result object. The following methods are available:

- contents
- is_error?
- errors
- page
- per_page
- total_items
- range
- range_start
- range_end
- raw_headers

### Supported Endpoints

- *Users* - get, save
- *Localizations* - query, get, save, delete
- *Locales* - query, get, save, delete
