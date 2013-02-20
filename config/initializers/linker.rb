IdentityLinker.configure do |config|
  config.server_id = Rails.configuration.linker_server_id
  config.server_secret = Rails.configuration.linker_server_secret
end
