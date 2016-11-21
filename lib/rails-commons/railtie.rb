module RailsCommons
  class Railtie < Rails::Railtie
    rake_tasks do
      require 'tasks/mailchimp'
    end
  end
end