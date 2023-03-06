class ToDosController < ApplicationController


    def index
        if current_user
            @todos = User.find_by(username: @current_user.username).to_dos
        else
            flash[:failure] = "You must log in to see your to do list!"
            redirect_to new_session_path
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
        
        if params[:list_id]
            @todo.list_id = params[:list_id]
        end
        @todo.is_complete = false
        @todo.user = @user
        if @todo.save
            flash[:success] = "successfully added new todo"
            unless request.fullpath.include? "lists"
                redirect_to to_dos_path and return 
            end
            redirect_to list_path @todo.list
        else
            flash[:failure] = "something went wrong"
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @todo = ToDo.find(params[:id])

        if @todo.update(to_do_params)
            flash[:success] = "successfully updated to do"
            unless request.fullpath.include? "lists"
                redirect_to to_dos_path and return 
            end
            redirect_to list_path @todo.list
        else
            flash[:failure] = "something went wrong. not updated"
            render :edit, status: :unprocessable_entity
        end

    end

    def destroy
        @todo = ToDo.find(params[:id])
        if @todo.delete
            flash[:success] = "Todo successfully deleted"
            unless request.fullpath.include? "lists"
                redirect_to to_dos_path and return 
            end
            redirect_to list_path(@todo.list)
        else
            flash[:failure] = "todo not deleted"
            unless request.fullpath.include? "lists"
                redirect_to to_dos_path and return 
            end
            redirect_to list_path(@todo.list)
        end
    end
    

    private 
    def to_do_params
        params.require(:to_do).permit(:description, :is_complete, :user_id, :list_id)
    end
    
end