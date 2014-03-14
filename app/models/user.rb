class User < ActiveRecord::Base

	def self.from_github (auth_hash)
		user = User.where(provider: auth_hash[:provider], uuid: auth_hash[:uid]).first_or_create
		user.token = auth_hash.credentials.token
		user.email = auth_hash.info.email
		user.name = auth_hash.info.name
		user.image = auth_hash.info.image
		user.save!
		user
	end
end
