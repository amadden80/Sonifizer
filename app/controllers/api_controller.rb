
class ApiController < ApplicationController

    before_action :get_stamp

    

    def index

        msg = { :info => @stamp,
                :type => "empty", 
                :message => "Success!"}

        respond_to do |format|
            format.html
            format.json  { render :json => msg } 
        end
        
    end


    def char_array

        msg = { :info => @stamp,
                :type => "Character Array",
                :message => "Success!"}

        respond_to do |format|
            format.html
            format.json  { render :json => msg } 
        end
        
    end


    private

    def get_stamp
        @stamp = {  :written_by => "Andrew Madden", 
                :api => "Sonifizer", 
                :site => "http://Sonifizer.com"} 
    end

end

