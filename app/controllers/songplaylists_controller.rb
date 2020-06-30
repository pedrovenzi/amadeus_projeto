class SongplaylistsController < ApplicationController

    ##### Autenticação #####
    before_action :require_login

    ##### SHOW #####
    def index
        # @current_user = User.find(session["user_id"])
        # @listener = @current_user.listener
        # @songplaylists = SongPlaylist.where(listener_id: @listener)
    end

    ###### CREATE #####
    def new
        @songplaylist = SongPlaylist.new
    end

    def create
        @songplaylist = SongPlaylist.create(songplaylistt_params)
        redirect_to playlist_path(@songplaylist.playlist)
    end

    ##### DELETE #####
    def destroy
        @songplaylist = SongPlaylist.find(params[:id])
        @playlist = @songplaylist.playlist
        @songplaylist.destroy

        redirect_to playlists_path
    end

    # ADD IN A PRIVATE METHOD FOR SONGPLAYLIST_PARAMS
    private
        def songplaylist_params
            params.require(:songplaylist).permit(:song_id, :listener_id)
        end

        def require_login
            unless logged_in?
                redirect_to "/auth/login"
            end
        end
end
