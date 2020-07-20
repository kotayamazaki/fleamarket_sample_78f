require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.aws["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: Rails.application.credentials.aws["AWS_SECRET_ACCESS_KEY"],
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'fleamarket78f'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/fleamarket78f'
end