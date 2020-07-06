class FavoritesongsController < ApplicationController

    ##### Autenticação #####
    before_action :require_login
    before_action :listener_login

    ##### SHOW #####
    def index
        @current_user = User.find(session["user_id"])
        @listener = @current_user.listener
        @favorites = FavoriteSong.where(listener_id: @listener)
        @song = Song.all
    end

    ###### CREATE #####
    def new
        @favorite = FavoriteSong.new
    end
    
    def create
        @favorite = FavoriteSong.new(favorite_params)
        @favorite.save!
        redirect_to favoritesongs_path
    end

    ##### DELETE #####
    def destroy
        @favorite = FavoriteSong.find(params[:id])
        @favorite.destroy
        redirect_to favoritesongs_path
    end

    # ADD IN A PRIVATE METHOD FOR FAVORITESONGS_PARAMS
    private
        def favorite_params
            params.require(:favorite).permit(:listener_id, :song_id)
        end
end
