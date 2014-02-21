class TasksController < ApplicationController
  def new
  end

  def create
    matter_id = params[:matter_id]
    matter = current_user.matters.find(matter_id)
    task = matter.tasks.create(start_time: Time.now)
    current_task.update(end_time: Time.now) if current_task
    current_user.update(current_task_id: task.id)
    redirect_to matter_path(matter)
  end

  # def show
  #
  # end

  def index
    #may not need this action
  end

  def stop
    @task = Task.find(params[:id])
    @task.update(end_time: Time.now)
    current_user.update(current_task_id: nil)
    redirect_to user_path(current_user)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    type = Type.find_by(name: params[:task][:type])
    @task.update(type: type, start_time: params[:task][:start_time], end_time: params[:task][:end_time], description: params[:task][:description])
    redirect_to matter_path(@task.matter)
  end

  def update_current
    @task = Task.find(params[:id])
    type = Type.find_by(name: params[:task][:type])
    @task.update(description: params[:task][:description], type: type)
    redirect_to matter_path(@task.matter)
  end
end
