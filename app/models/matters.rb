class Matters < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  has_many :tasks

end
