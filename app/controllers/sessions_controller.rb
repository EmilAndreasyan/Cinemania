class SessionsController < ApplicationController

    def new 
    end

    # def create
    #     user = User.find_by(:email => params[:email])
    #     if 
    #         !user # not user
    #         @error = "Account not found"
    #         render :new
    #     elsif
    #         user && !user.authenticate(params[:password])
    #         @error = "Password is incorrect"
    #         render :new
    #     elsif 
    #         user && user.authenticate(params[:password])
    #         flash[:success] = "You have successfully logged in"
    #         session[:user_id] = user.id
    #         redirect_to user_path(user)
    #     end
    # end
    

    def create
        if auth_hash = request.env["omniauth.auth"]
            user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = user.id
            redirect_to users_path(user)
        else
            user = User.find_by(:email => params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user
            else
                flash[:error] = "Incorrect email or password"
                render :new
            end
        end
    end

    def destroy
        session.destroy
        flash[:notice] = "You have successfully logged out"
        redirect_to root_url
    end
end
