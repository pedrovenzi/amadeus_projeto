class UsersController < ApplicationController
    def new
        @user = User.new
        # @artist = Artist.new
        # @listener = Listener.new
    end
  
    def create
        @user = User.new(users_params)
        # @artist = Artist.new(category_params)
        @listener = Listener.new(listener_params)
        if @user.save
            # if :role_id == 1
            # elsif :tole_id == 2
            # @listener.save
            #end
            redirect_to root_path
        else
            render 'new'
        end
    end

    private
        def users_params
            params.require('user').permit(:name, :role_id, :email, :password)
        end
        
        def listener_params
            params.require('listener').permit(@user_id)
        end
end