class SessionsController < ApplicationController
  # GET /login
  def new
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @user = User.authenticate(params[:user][:username], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      render :json => @user
    else
      render json: {}, status: 400
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    session[:user_id] = nil
    head :no_content
  end
end
