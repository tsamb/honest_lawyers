class MattersController < ApplicationController
  def new
    #Form for creating a new matter
    #will need to know the User creating the matter
    #probably will look up the User via cookie
    #will need to look up Clients for the User to fill in the Clients menu
  end

  def create
    #Will have to parse to determine 'client'
      #You can either select a :client or fill out :new_client field in form
      #Determine if :new_client or :client
      #If :new_client, create new Client with value of :new_client field
      #If :client, look up Client
    #Will have to look up user from cookie
      #Unless there is a way to use form helpers to make user_id show up in params
    #Once 'user', 'client', and 'description' are defined, create new Matter
    #redirect_to matter_path(matter)
  end

  def show
    #look up Matter based on params[:id]
    #redirect if matter.user_id != current_user ?
    #look up Client associated with matter
    #look up all Tasks belonging to matter
    #somehow or another, total up all hours spent on tasks
  end

  def index
    #look up User via session
    #look up all Matters for user
  end
end