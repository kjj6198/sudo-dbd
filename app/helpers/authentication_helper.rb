module AuthenticationHelper
    def auth_google_user!
        unless current_user
            redirect_to user_omniauth_authorize_path(:google_oauth2)    
        end
    end
end