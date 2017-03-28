class User < ApplicationRecord
  include Clearance::User

  validates :email, uniqueness: true
  has_many :authentications, :dependent => :destroy
  #ensuring that all of the dependents of authentications gets destroyed as well
  has_many :listings
  has_many :reservations

# upload profile photo
  mount_uploader :image, ImageUploader


#create a User object based on the information given by the provider
  def self.create_with_auth_and_hash(authentication, auth_hash)
      user = User.create!(name: auth_hash["name"], email: auth_hash["extra"]["raw_info"]["email"])
      user.authentications << (authentication)
      return user
  end


  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  # def password_optional?
  #   true
  # end
end
