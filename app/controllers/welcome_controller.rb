class WelcomeController < ApplicationController
  before_action :locate 
  def index
  end
  
  private
     def locate
        @geoip ||= GeoIP.new(::Rails.root.join('db','GeoIP.dat'))  
        remote_ip = request.remote_ip 
        if remote_ip != "127.0.0.1"
            country = @geoip.country(remote_ip)
            if country != nil
                redirect(country[:country_name])
            end
        elsif !Redirection.all.empty?
            redirect(Redirection.first.country)
        end
     end

     def redirect(current_country)
        pos = Redirection.where(country:current_country).first
        if pos != nil && pos[:active]
            hyperlink = pos[:hyperlink]
            redirect_to hyperlink.to_s
        end
     end
end
