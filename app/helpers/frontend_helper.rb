module FrontendHelper
    def show_navbar?
        params[:controller] == 'frontend' && params[:action] == 'index'
    end

    def render_time(datetime)
        datetime.strftime("%I:%M %p")
    end

    def render_time_with_date(datetime)
        datetime.strftime("%m/%d")
    end

    def duration_time(endtime)
        curTime = (endtime-DateTime.now).to_i
        if curTime <= 0 
            "已截止"
        else
            minutes = (curTime /60).to_i
            seconds = curTime % 60
            "#{minutes} : #{seconds}"
        end
        
    end
end
