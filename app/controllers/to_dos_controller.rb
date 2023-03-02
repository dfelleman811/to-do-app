class ToDosController < ApplicationController


    def index
        if current_user
            @todos = User.find_by(username: @current_user.username).to_dos
        else
            flash.alert = "You must lof in to see your to do list!"
            redirect_to "/login"
        end
    end

    def show
        @todo = ToDo.find(params[:id])
    end

    def new
        @todo = ToDo.new
    end

    def edit
        @todo = ToDo.find(params[:id])
    end

    def create 
        if current_user
            @user = @current_user
        end
        @todo = ToDo.new(to_do_params)
        @todo.is_complete = false
        @todo.user = @user
        if @todo.save
            flash.notice = "successfully added new todo"
            redirect_to root_path
        else
            flash.alert = "something went wrong"
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @todo = ToDo.find(params[:id])

        if @todo.update(to_do_params)
            flash.notice = "successfully updated to do"
            redirect_to root_path
        else
            flash.alert = "something went wrong. not updated"
            render :edit, status: :unprocessable_entity
        end

    end

    def destroy
        @todo = ToDo.find(params[:id])
        if @todo.delete
            flash.notice = "Todo successfully deleted"
            redirect_to root_path
        else
            flash.alert = "todo not deleted"
            redirect_to root_path
        end
    end
    

    private 
    def to_do_params
        params.require(:to_do).permit(:description, :is_complete, :user_id)
    end
    
end