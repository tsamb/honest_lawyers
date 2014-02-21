class User < ActiveRecord::Base
  has_many :matters

  has_secure_password

  validates_presence_of :email, :password, :name

end
