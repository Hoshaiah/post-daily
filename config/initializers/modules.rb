# Require all files from lib/aws folder
Dir[Rails.root.join('lib/aws/**/*.rb')].each { |file| require file }

AWS_S3_CLIENT = Aws::S3::Client.new(
  region: 'us-east-1',
  access_key_id: ENV['ACCESS_KEY_ID'],
  secret_access_key: ENV['SECRET_ACCESS_KEY']
)