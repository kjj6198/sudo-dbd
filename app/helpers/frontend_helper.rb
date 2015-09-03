module FrontendHelper
    def show_navbar?
        params[:controller] == 'frontend'
    end
end
