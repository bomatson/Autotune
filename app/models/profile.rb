class Profile < ActiveRecord::Base
  attr_accessible :user, :first_name, :last_name
  belongs_to :user
end
