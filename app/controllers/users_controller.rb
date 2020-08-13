class UsersController < ApplicationController
    
 
    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if  @user.save
            flash[:notice] = "You have successfully created an account"
            session[:user_id] = @user.id
            redirect_to @user
        else
           flash[:notice] = "Please, enter valid data"
           render :new
        end
    end

    def index
        @users = User.all
        @user = User.find_by(id: params[:id])
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
