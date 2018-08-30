# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Stripe.api_key = Rails.configuration.stripe[:secret_key]
