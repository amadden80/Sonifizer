
class ApiController < ApplicationController

    include ApplicationHelper
    before_action :get_stamp

    def index

        @tone_audio_data_01 = get_tone_audio_text_file(200, 0.25, 44100, 0.75)
        @tone_audio_data_02 = get_tone_audio_text_file(880, 0.25, 44100, 0.75)
        @slide_audio_data_01 = get_slide_tone_audio_text_file(100, 1000, 0.25, 44100, 0.75)
        @slide_audio_data_02 = get_slide_tone_audio_text_file(1000, 100, 0.25, 44100, 0.75)
        @data_audio_data_01 = get_data_tone_audio_text_file([1, 2, 3, 2, 1], 500, 700, 2, 44100, 0.75)
        @data_audio_data_02 = get_data_tone_audio_text_file([1, 100, 50, 500, 75, 750, 100, 1000, 200, 2000], 500, 700, 2, 44100, 0.75)
        @string_audio_data_01 = get_string_tone_audio_text_file("abczzz", 200, 500, 1, 44100, 0.75)
        @string_audio_data_02 = get_string_tone_audio_text_file("Sonifizer2013", 200, 500, 1, 44100, 0.75)

        msg = { :info => @stamp,
                :type => "empty", 
                :message => "Success!"}

        respond_to do |format|
            format.html {}
            format.json  { render :json => msg } 
        end   

    end

    def username_responder
        username = params["username"] || "Sonifizer"
        @response = get_string_response(username, 200, 800, 0.5, 8000)
        format.html {render "user.html"}
    end


    def username_responder_json
        username = params["username"] || "Sonifizer"
        @response = get_string_response(username, 200, 800, 0.5, 8000)
        render "user.js.erb", layout: false
    end


    def string_responder_json
        string = params["string"] || "Sonifizer"
        @response = get_string_response(string, 200, 800, 1, 8000)
        render "string.js.erb", layout: false
    end


    def array_responder_json
        data_array = params["data_array"] || [1000, 100, 1, 0]
        @response = get_array_response(data_array, 200, 800, 1, 8000)
        render "array.js.erb", layout: false
    end


    private

    def get_string_response(username, lowFreq, highFreq, seconds, fs)
        audio_data = get_string_tone_audio_text_file(username, lowFreq, highFreq, seconds, fs, 0.75)
        response = { :audio=> audio_data,
                :info => @stamp,
                :type => "Character Array",
                :message => "Success!", 
                :username => username}
        response
    end

    def get_array_response(data_array, lowFreq, highFreq, seconds, fs)
        audio_data = get_data_tone_audio_text_file(data_array, low_freq, high_freq, seconds, fs, 0.75)
        response = { :audio=> audio_data,
                :info => @stamp,
                :type => "Character Array",
                :message => "Success!"
                }
        response
    end



    def get_stamp
        @stamp = {  :written_by => "Andrew Madden", :api => "Sonifizer", :site => "http://Sonifizer.com"} 
    end

end

