class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, #:recoverable,
    :rememberable, :trackable, :validatable,:omniauthable,
    omniauth_providers: [:facebook]

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user.present?
      user
    else
      user = User.create(first_name:auth.extra.raw_info.first_name,
												 last_name:auth.extra.raw_info.last_name,
												 facebook_link:auth.extra.raw_info.link,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20])
    end
  end

  # Rails 4 switched from using attr_accessor to strong parameters
  # I can Change and Edit in app/controllers/applicationcontroller.rb

  has_many :listings, dependent: :destroy

	has_many :messages

  has_attached_file :avatar, default_url: "http://placehold.it/300x300&text=missing",
    styles: { profile: "153x153#",
      thumb:   "100x100>",
      avatar:   "64x64#" }

  validates :user_bio, length: { maximum: 180 }

	# for name instead of id in the link
	def to_param
		name
	end

end
