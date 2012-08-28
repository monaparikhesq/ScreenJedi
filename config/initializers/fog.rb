# CarrierWave.configure do |config|

# 	if Rails.env.production? 
# 		#allows assets to be saved on s3 while in production/heroku
#     	config.root = Rails.root.join('tmp')
#     	config.cache_dir = 'carrierwave'
#     	config.storage = :s3

#     	# add the access keys and bucket name for s3 in terminal using the below statement
#     	# heroku config:add s3_access_key_id=['AKIAIVZCLXWCR5SWMEXA'] s3_secret_access_key=['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'] s3_bucket=['screenjedi_assets']

#     	config.s3_access_key_id = ENV['s3_access_key_id']
#     	config.s3_secret_access_key = ENV['s3_secret_access_key']
#     	config.s3_bucket = ENV['s3_bucket']

# 	else
#     	config.root = Rails.root.join('tmp')
#     	config.cache_dir = 'carrierwave'
#     	config.storage = :s3
#     	config.s3_access_key_id = 'AKIAIVZCLXWCR5SWMEXA'
#     	config.s3_secret_access_key = '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'
#     	config.s3_bucket = 'screenjedi_assets'
#     end
# end 


