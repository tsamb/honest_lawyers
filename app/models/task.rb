class Task < ActiveRecord::Base
  belongs_to :matter
  belongs_to :type

  def time_units
    if self.end_time
      ((self.end_time - self.start_time) / 360).ceil
    end
  end

end
