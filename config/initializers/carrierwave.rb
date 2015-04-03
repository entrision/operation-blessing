CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => Rails.application.secrets.s3_key,
    :aws_secret_access_key => Rails.application.secrets.s3_secret_key
  }
  config.fog_directory    = Rails.application.secrets.s3_bucket
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}

  if Rails.env.test?
    Fog.mock!
    connection = Fog::Storage.new config.fog_credentials
    connection.directories.create(key: Rails.application.secrets.s3_bucket)
    config.enable_processing = false
  end
end
