class SongplaylistsController < ApplicationController

    ##### Autenticação #####
    before_action :require_login
    before_action :listener_login

    ##### SHOW #####
    def index
    end

    ###### CREATE #####
    def new
        @songplaylist = SongPlaylist.new
    end

    def create
        @songplaylist = SongPlaylist.create(songplaylist_params)
        redirect_to playlists_path
    end

    ##### DELETE #####
    def destroy
        @songplaylist = SongPlaylist.find(params[:id])
        @playlist = @songplaylist.playlist
        @songplaylist.destroy

        redirect_to playlist_path(@playlist)
    end

    # ADD IN A PRIVATE METHOD FOR SONGPLAYLIST_PARAMS
    private
        def songplaylist_params
            params.require(:song_playlist).permit(:song_id, :playlist_id)
        end
end
