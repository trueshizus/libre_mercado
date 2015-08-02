CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/public"
  else
    config.storage = :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     Rails.application.secrets.amazons3_s3_key,
      aws_secret_access_key: Rails.application.secrets.amazons3_s3_secret,
      region:                Rails.application.secrets.amazons3_s3_region
    }
    config.fog_directory  = Rails.application.secrets.amazons3_s3_bucket_name
    config.cache_dir = "#{Rails.root}/public/uploads"                  # To let CarrierWave work on heroku
  end
end
