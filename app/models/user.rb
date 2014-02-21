class User < ActiveRecord::Base
  has_many :matters

  has_secure_password

  validates_presence_of :email, :name#, :password # leaving this here breaks saving on the user object

  def current_task_seconds
    if self.current_task_id
      task = Task.find(self.current_task_id)
      (Time.now - task.start_time).to_i
    else
      nil
    end
  end

  def current_task
    if self.current_task_id
      Task.find(self.current_task_id)
    else
      nil
    end
  end

end
