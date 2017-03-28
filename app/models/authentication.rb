class Authentication < ApplicationRecord
  belongs_to :user

  #Create an authentication object
  def self.create_with_omniauth(auth_hash)
    create! do |auth|
      auth.provider = auth_hash["provider"]
      auth.uid = auth_hash["uid"]
      auth.token = auth_hash["credentials"]["token"]
    end
  end

  #Update an authentication object
  def update_token(auth_hash)
    self.token = auth_hash["credentials"]["token"]
    self.save
  end

end
