class Users < ActiveRecord::Base
  has_many :matters

  has_secure_password

end
