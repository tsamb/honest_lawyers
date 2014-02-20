class Task < ActiveRecord::Base
  belongs_to :matter
  belongs_to :type
end
