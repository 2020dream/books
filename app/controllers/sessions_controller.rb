class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
      auth_hash = request.env['omniauth.auth']

      if auth_hash[:uid]
        @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
        # @user = User.find_by(uid: auth_hash[:uid], provider: params[:provider])

        if @user.nil?
          @user = User.build_from_github(auth_hash)
          successful_save = @user.save

          if successful_save
            flash[:success] = "Logged in successfully"
            session[:user_id] = @user.id
            redirect_to root_path
          else
            flash[:error] = "Some error happened in User creation"
            redirect_to root_path
          end
          
        else
          flash[:success] = "Logged in successfully"
          session[:user_id] = @user.id
          redirect_to root_path
        end

      else
        flash[:error] = "Logging in through GitHub not successful"
        redirect_to root_path
      end

    # @user = User.find_by(name: params[:user][:name])
    # if @user
    #   session[:user_id] = @user.id
    #   flash[:success] = "Welcome back #{@user.name}"
    # else
    #   @user = User.create(name: params[:user][:name])
    #   session[:user_id] = @user.id
    #   flash[:success] = "Welcome #{@user.name}"
    # end
    # redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You logged out!"
    redirect_to root_path
  end
end
