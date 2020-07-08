class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(users_params)
        if @user.save
            if params[:user][:role_id].eql? '1'
                @artist = Artist.create(user_id: @user.id)
            else
                @listener = Listener.create(user_id: @user.id)       
            end
            redirect_to root_path
        else
            render 'new'
        end
    end
    private
        def users_params
            params.require('user').permit(:name, :role_id, :email, :password)
        end
end

