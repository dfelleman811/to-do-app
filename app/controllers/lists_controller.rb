class ListsController < ApplicationController

    # before_action :current_user

    def index
        if current_user
            @lists = User.find_by(id: @current_user.id).lists
        else
            flash[:failure] = "You must log in to see your lists of to dos!"
            redirect_to new_session_path
        end
    end


    def show 
        @list = List.find(params[:id])
    end

    def new
        @list = List.new
    end

    def create 
        if current_user
            @current_user.lists.create(list_params)
            flash[:success] = "successfully created new list"
            redirect_to lists_path
        else
            flash[:failure] = "You must be logged in to create new lists!"
            redirect_to new_session_path
        end
    end

    # edit


    # update

    # destroy


    private
    def list_params
        params.require(:list).permit(:category, :user_id)
    end

    
end