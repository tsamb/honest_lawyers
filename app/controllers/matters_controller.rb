class MattersController < ApplicationController

  # REVISIT - where to place the following method
  def time_formatter(seconds)
    hours = seconds / 1.hour
    minutes = (seconds % 1.hour) / 1.minute
    "#{hours.floor} hours, #{minutes.floor} minutes"
  end

  def new
    #Form for creating a new matter
    #will need to know the User creating the matter
    #probably will look up the User via cookie
    #will need to look up Clients for the User to fill in the Clients menu

    @user = User.find(params[:user_id])
    @clients = Client.all.to_a
    @clients.insert(0, Client.new)
  end

  def create
    client = Client.create(name: params[:new_client], number: 300)
    user = User.find(params[:user_id])
    description = params[:description]
    user.matters.create(description: description, client: client)
    redirect_to user_path(user)
    #Will have to parse to determine 'client'
      #You can either select a :client or fill out :new_client field in form
      #Determine if :new_client or :client
      #If :new_client, create new Client with value of :new_client field
      #If :client, look up Client
    #Will have to look up user from cookie
      #Unless there is a way to use form helpers to make user_id show up in params
    #Once 'user', 'client', and 'description' are defined, create new Matter
    #Matter will by default have 'open' attribute set to true
    #redirect_to matter_path(matter)
  end


  def show
    #look up Matter based on params[:id]
    #redirect if matter.user_id != current_user ?
    #look up Client associated with matter
    #look up all Tasks belonging to matter
    #somehow or another, total up all hours spent on tasks

    # redirect_to root_path unless params[:id] != current_user.id
    @matter = Matter.find(params[:id])
    @tasks = @matter.tasks

    @total = 0
    @tasks.each do |task|
      if task.end_time
        time = task.end_time - task.start_time
        @total += time
      end
    end

    @total_string = time_formatter(@total)
  end

  def index
    #look up User via session
    #look up all Matters for user
  end

  def edit
    #look up Matter based on params[:id]
    #probably will only care about editing description in view
  end

  def update
    #look up Matter based on params
    #update description based on params
    #redirect to matter_path(matter)
  end

  def close
    #look up Matter based on params[:id]
    #set 'open' to 'false'
    #redirect to matter_path(matter)? or to user_path(current_user)
  end
end
