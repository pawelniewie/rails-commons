# Common stuff for Rails applications

## Adding user to a mailing list

Update `Gemfile` with:

```
gem 'gibbon'
```

Add following entries to `secrets.yml`

```yaml
mailchimp_key: <%= ENV['MAILCHIMP_KEY'] %>
mailchimp_list_id: <%= ENV['MAILCHIMP_LIST_ID'] %>
mailchimp_interest_ids: <%= ENV['MAILCHIMP_INTEREST_IDS'] %>
```

Create file `config/initializers/mailchimp.rb`

```ruby
Gibbon::Request.api_key = Rails.application.secrets.mailchimp_key
Gibbon::Request.timeout = 15
Gibbon::Request.logger = Rails.logger
```

Call `SubscribeJob.perform_later('email@me.com')` to add a subscriber to your list.

## Requirements

Ruby 2.0+, ActiveRecord 5+, Rails 5+