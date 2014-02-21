class User < ActiveRecord::Base
  has_many :matters

  has_secure_password

  validates_presence_of :email

  def current_task_seconds
    if self.current_task_id
      task = Task.find(self.current_task_id)
      (Time.now - task.start_time).to_i
    else
      return nil
    end
  end

end
