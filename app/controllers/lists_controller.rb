class ListsController < ApplicationController

    def index
        if current_user
            @lists = User.find_by(id: @current_user.id).lists
        else
            flash[:failure] = "You must lof in to see your lists of to dos!"
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
        @current_user.lists.build(list_params)
    end


    private
    def list_params
        params.require(:list).permit(:category, :user_id)
    end

end