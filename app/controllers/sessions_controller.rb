class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash.notice = "Successfully logged in"
            redirect_to to_dos_path
        else
            flash.alert = "Invalid Username and/or Password"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        session.delete(:user_id)
        @current_user = nil
        redirect_to login_path
    end
end