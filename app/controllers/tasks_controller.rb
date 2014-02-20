class TasksController < ApplicationController
  def new
  end

  def create
    #tasks routes are nested under matters routes
    #look up Matter via matter_id in params
      #matter_id will appear in params because task#create route is nested under matters routes
    #generate new Task belonging to current_user and 'matter'
      #type, description will be blank
      #time_started = Time.now
    #redirect_to view_task_path(task)
  end

  def show
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
    #look up Task from params[:id]
    #set end_time to Time.now
    #redirect to matter_path(task.matter)
  end

  def edit
    #look up Task
    #display view very similar to one of the two views in #show
      #difference: 'type' and 'desc' are form fields, filled in with current values of 'type' and 'desc'
  end

  def update
    #update Task with form info from params
    #redirect_to task_path(task)
  end
end