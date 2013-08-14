class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable,
         :rememberable, :trackable, :validatable,:omniauthable,
				 :omniauth_providers => [:facebook]

	def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
		user = User.where(:provider => auth.provider, :uid => auth.uid).first
		unless user
			user = User.create(name:auth.extra.raw_info.name,
												 provider:auth.provider,
												 uid:auth.uid,
												 email:auth.info.email,
												 password:Devise.friendly_token[0,20]
			)
		end
		user
	end

	# Rails 4 switched from using attr_accessor to strong parameters
	# I can Change and Edit in app/controllers/applicationcontroller.rb

	# ONE user has MANY Listings
	has_many :listings, :dependent => :destroy

	has_attached_file :avatar, :styles => { :profile => "153x153#",
																					:thumb => "100x100>",
																					:avatar => "64x64>" },
										:default_url => "http://placehold.it/300x300&text=missing"

	validates :user_bio, length: { maximum: 180 }
end
