class PlaylistsController < ApplicationController

    ##### Autenticação #####
    before_action :require_login
    before_action :listener_login

    ##### SHOW #####
    def index
        @current_user = User.find(session["user_id"])
        @listener = @current_user.listener
        @playlists = Playlist.where(listener_id: @listener)
    end

    def show
        @playlist = Playlist.find(params[:id])
    end

    ###### CREATE #####
    def new
        @playlist = Playlist.new
    end
    
    def create
        @playlist = Playlist.new(playlist_params)
        begin
            @playlist.save!
            flash[:notice] = "Playlist #{@playlist.name} criada com sucesso"
        rescue => exception
            flash[:notice] = exception
        ensure
            redirect_to playlists_path
        end
    end

    ##### UPDATE #####
    def edit
        @playlist = Playlist.find(params[:id])
    end
    
    def update
        @playlist = Playlist.find(params[:id])
        begin
            @playlist.update!(playlist_params)
            flash[:notice] = "Playlist #{@playlist.name} atualizada com sucesso"
        rescue => exc
            puts exc
            flash[:notice] = exc
        ensure
            redirect_to playlists_path
        end
    end

    ##### DELETE #####
    def destroy
        @playlist = Playlist.find(params[:id])
        begin
            @playlist.destroy!
            flash[:notice] = "Playlist #{@playlist.name} apagada com sucesso"
        rescue => exc
            puts exc
            flash[:notice] = exc
        ensure
            redirect_to playlists_path
        end
    end

    # ADD IN A PRIVATE METHOD FOR PLAYLISTs_PARAMS
    private
        def playlist_params
            params.require(:playlist).permit(:name, :listener_id)
        end
end
