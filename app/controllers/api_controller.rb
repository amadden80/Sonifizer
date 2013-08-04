
class ApiController < ApplicationController

    include ApplicationHelper
    before_action :get_stamp
    skip_before_action :verify_authenticity_token, if: :json_request?

    def index

        @tone_audio_data_01 = get_tone_audio_text_file(440, 0.1, 44100, 0.75)
        @tone_audio_data_02 = get_tone_audio_text_file(440, 0.1, 44100, 0.75)
        @slide_audio_data_01 = get_slide_tone_audio_text_file(1000, 100, 0.1, 44100, 0.75)
        @slide_audio_data_02 = get_slide_tone_audio_text_file(100, 1000, 0.1, 44100, 0.75)
        @data_audio_data_01 = get_data_tone_audio_text_file([1, 2, 1, 1], 100, 1000, 2, 44100, 0.75)
        @data_audio_data_02 = get_data_tone_audio_text_file([5, 4, 3, 2, 1, 3, 5], 500, 700, 2, 44100, 0.75)
        @string_audio_data_01 = get_string_tone_audio_text_file("aazazzzazaazz", 200, 500, 0.5, 44100, 0.75)
        @string_audio_data_02 = get_string_tone_audio_text_file("Sonifizer1983", 200, 500, 0.5, 44100, 0.75)

        msg = { :info => @stamp,
                :type => "empty", 
                :message => "Success!"}

        # respond_to do |format|
        #     format.html {}
        #     format.json  { render :json => msg } 
        # end   

    end


    def username_responder
        params["username"] = params["username"] || "Sonifizer"

        worker = SonifizerWorker.new()
        @audio_data = get_string_tone_audio_text_file(params["username"], 200, 800, 0.5, 8000, 0.75)

        msg = { :audio=> @audio_data,
                :info => @stamp,
                :type => "Character Array",
                :message => "Success!"}

        respond_to do |format|
            format.json  {render :json => msg}
        end        

    end


    protected

    def json_request?
        request.format.json?
    end

    private

    def get_stamp
        @stamp = {  :written_by => "Andrew Madden", :api => "Sonifizer", :site => "http://Sonifizer.com"} 
    end



end

