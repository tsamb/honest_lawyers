class Tasks < ActiveRecord::Base
  belongs_to :matter
  has_many :types
end
