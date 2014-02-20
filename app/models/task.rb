class Task < ActiveRecord::Base
  belongs_to :matter
  has_many :types
end
