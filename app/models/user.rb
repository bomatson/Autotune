class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :profile_attributes, :email, :password, :password_confirmation, :remember_me
  has_one :profile
  accepts_nested_attributes_for :profile
  # Setup accessible (or protected) attributes for your model

  # attr_accessible :title, :body
  after_create :build_profile 

end
