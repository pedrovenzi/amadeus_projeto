class SongsController < ApplicationController
    
    ##### Autenticação #####
    before_action :require_login
    
    ##### SHOW #####
    def index
        @songs = Song.all
        @current_user = User.find(session["user_id"])
        @listener = @current_user.listener
        @favorites = FavoriteSong.where(listener_id: @listener)
    end

    def show
        @song = Song.find(params[:id])
    end

    ###### CREATE #####
    def new
        @song= Song.new
    end
    
    def create
        @song = Song.new(song_params)
        
        begin
            @song.save!
            flash[:notice] = "Musica #{@song.name} criado com sucesso"
        rescue => exc
            puts exc
            flash[:notice] = exc
        ensure
            redirect_to songs_path
        end
    end
    
    ##### UPDATE #####
    def edit
        @song = Song.find(params[:id])
    end
    
    def update
        @song = Song.find(params[:id])
    
        begin
            @song.update!(song_params)
            flash[:notice] = "Musica #{@song.name} atualizada com sucesso"
        rescue => exc
            puts exc
            flash[:notice] = exc
        ensure
            redirect_to songs_path
        end
    end

    ##### DELETE #####
    def destroy
        @song = Song.find(params[:id])
        begin
            @song.destroy!
            flash[:notice] = "Musica #{@song.name} deletada com sucesso"
        rescue => exc
            puts exc
            flash[:notice] = exc
        ensure
            redirect_to songs_path
        end
    end
    
    # ADD IN A PRIVATE METHOD FOR SONG_PARAMS
    private
        def song_params
            params.require(:song).permit(:name, :explicit, :album_id, :genre, :file)
        end
end
