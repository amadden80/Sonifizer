class ApiController < ApplicationController

    def index

        msg = {:message => "Success!"}

        respond_to do |format|
            format.html
            format.json  { render :json => msg } 
        end
        
    end

end


    