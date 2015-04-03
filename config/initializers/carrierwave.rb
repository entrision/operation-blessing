CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => Rails.application.secrets.s3_key || ENV['S3_KEY'],
    :aws_secret_access_key => Rails.application.secrets.s3_secret_key || ENV['S3_SECRET_KEY']
  }
  config.fog_directory    = Rails.application.secrets.s3_bucket || ENV['S3_BUCKET']
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}

  if Rails.env.test?
    Fog.mock!
    connection = Fog::Storage.new config.fog_credentials
    connection.directories.create(key: Rails.application.secrets.s3_bucket)
    config.enable_processing = false
  end
end
