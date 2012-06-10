class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  #
  #attr_accessible :profile_attributes, :email, :password, :password_confirmation, :remember_me
  #has_one :profile
  #accepts_nested_attributes_for :profile
  ## Setup accessible (or protected) attributes for your model
  #
  ## attr_accessible :title, :body
  #after_create :build_profile

  def self.sign_in_with_auth_hash(auth_hash, access_token)
    user = User.find_by_auth_hash(auth_hash)

    if user
      return user
    end

    if auth_hash[:provider] == 'twitter'
      user = User.new
      user.name = auth_hash['info']['name']
      user.twitter_id = auth_hash['uid']
      user.twitter_name = auth_hash['info']['nickname']
      user.twitter_token = auth_hash['credentials']['token']
      user.twitter_secret = auth_hash['credentials']['secret']
      user.email = 'notnull'
      user.encrypted_password = 'notnull'
    end

    user.save!
    user
  end

  def self.find_by_auth_hash(auth_hash)
    case auth_hash[:provider]
      when 'twitter'
        User.where(twitter_id: auth_hash['uid']).first
      else
        nil
    end
  end
end
