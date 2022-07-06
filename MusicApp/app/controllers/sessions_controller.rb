class SessionsController < ApplicationController

    #login form for the user
    def new
        @user = User.new
        render :new
    end

    #checks to see if login was successful
    def create
        @user = User.find_by_creditials(params[:user][:email], params[:user][:password])

        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def destroy
        name = @current_user.email
        logout
        redirect_to new_session_url
    end

end