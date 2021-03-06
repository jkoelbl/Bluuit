class SessionsController < ApplicationController
  
  before_action :if_not_logged, :only => [:destroy]
  before_action :if_logged, :except => [:destroy]

  def new
  end

  def create
    if user = User.authenticate(params[:sessions])
      login = {
        :id => user.id,
        :username => user.username
      }
      login(login)
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
