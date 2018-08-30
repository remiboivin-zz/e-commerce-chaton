require 'mailjet'
Mailjet.configure do |config|
  config.api_key = '3c6830e7960ed7aa8e590777da567b5b'
  config.secret_key = 'd289d0234577fba0373903cd457bb254'
  config.default_from = 'remi50avj.c@live.fr'
  config.api_version = "v3.1"
end
