class ApplicationController < ActionController::Base
    def require_login
        unless logged_in?
            flash[:error] = "Você precisa estar logado"
            redirect_to "/auth/login"
        end
    end

    def artist_login
        unless @current_user.role_id == 1
            flash[:error] = "Você precisa ser um artista para entrar nessa página!"
            redirect_to "/"
        end
    end

    def listener_login
        unless @current_user.role_id == 2
            flash[:error] = "Você precisa ser um ouvinte para entrar nessa página!"
            redirect_to "/"
        end
    end
end
