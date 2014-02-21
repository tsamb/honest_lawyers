class TasksController < ApplicationController
  def new
  end

  def create
    matter_id = params[:matter_id]
    matter = current_user.matters.find(matter_id)
    task = matter.tasks.create(start_time: Time.now)
    current_user.update(current_task_id: task.id)
    redirect_to edit_task_path(task)
  end

  def show
    task = Task.find(params[:id])

    #Maybe give this method another name
    #route will be tasks/:task_id
    #look up Task via task_id
    #'task' will belong to a Matter, which will have an association with a Client
      #This will give us all the info we need for the view


    #Right now, we are collapsing two things into the show action:
        #if 'type' and 'description' are empty, we see a view with an empty form for filling in those fields
        #if 'type' and 'description' are filled in, we just see that info - no form
        #not sure if this logic belongs in the view, or in two  different actions
  end

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
    # render text:params.to_json
    # @task = Task.find(params[:id])
    # @task.update(params)
    #look up Task
    #display view very similar to one of the two views in #show
      #difference: 'type' and 'desc' are form fields, filled in with current values of 'type' and 'desc'
  end

  def update
    @task = Task.find(params[:id])
    type = Type.find_by(name: params[:task][:type])
    @task.update(description: params[:task][:description], type: type)
    redirect_to task_path(@task)
    #update Task with form info from params
    #redirect_to task_path(task)
  end
end
