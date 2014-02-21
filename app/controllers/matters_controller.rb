class MattersController < ApplicationController

  def new

    @user = User.find(params[:user_id])
    @clients = Client.all.to_a
    @clients.insert(0, Client.new)
  end

  def create

    if params[:client][:client_id] != ""
      client = Client.find(params[:client][:client_id])
    else
      client = Client.create(name: params[:new_client], number: 300)
    end

    user = User.find(params[:user_id])
    description = params[:matter][:description]
    matter = user.matters.create(description: description, client: client)
    redirect_to matter_path(matter)
  end


  def show
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
    @matters = current_user.matters
  end

  def update

    @matter = Matter.find(params[:id])
    @matter.update(description: params[:matter][:description])

    respond_to do |format|
      format.js {}
    end
  end

  def close
    @matter = Matter.find(params[:id])
    @matter.update(open: false)

    respond_to do |format|
      format.html {
        redirect_to matter_path(@matter)
      }

      format.js {}
    end
  end

  def search
    txt = params[:search]
    @matters = current_user.matters.find(
                  :all,
                  :conditions => ['lower(description) like ?', %(%#{txt.downcase}%)] )

  # NOTE: currently only search keyword by description. Case insensitive.

  # Pseudocode to include client name search in sql:

  # select *
  # from matters m
  # join user u
  #   on m.user_id = u.id
  # join client c
  #   on m.client_id = c.id
  # where u.id = 1
  #   and (     m.description like %%%%%
  #         or  c.name like %%%%
  #       )

  # Matter.joins(:user, :client) ---> 3-table joins.
  # - Need to find out syntax how to use 'where' in multi joins in active record
  # - Maybe have "advance search" feature?
  end
end
