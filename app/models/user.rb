class User < ActiveRecord::Base
  has_many :matters

  has_secure_password

end
