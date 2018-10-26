require 'gibbon'

module RailsCommons

  class SubscribeJob < ActiveJob::Base
    def perform(email, merge_fields = {})
      lower_case_md5_hashed_email_address = Digest::MD5.hexdigest(email.downcase)

      gb = Gibbon::Request.new
      gb.lists(Rails.application.secrets.mailchimp_list_id).members(lower_case_md5_hashed_email_address).upsert(
        body: {
          email_address: email,
          status_if_new: 'subscribed',
          merge_fields: merge_fields.compact || {},
          interests: interests
        })
    end

    def interests
      Hash[(Array(Rails.application.secrets.mailchimp_interest_ids) || []).map { |_| [_, true] }]
    end
  end

end