
class ApiController < ApplicationController

    include ApplicationHelper
    before_action :get_stamp

    def index

        @tone_audio_data_01 = get_tone_audio_text_file(440, 0.1, 44100, 0.75)
        @tone_audio_data_02 = get_tone_audio_text_file(440, 0.1, 44100, 0.75)
        @slide_audio_data_01 = get_slide_tone_audio_text_file(1000, 100, 0.1, 44100, 0.75)
        @slide_audio_data_02 = get_slide_tone_audio_text_file(100, 1000, 0.1, 44100, 0.75)
        @data_audio_data_01 = get_data_tone_audio_text_file([1, 2, 1, 1], 100, 1000, 2, 44100, 0.75)
        @data_audio_data_02 = get_data_tone_audio_text_file([5, 4, 3, 2, 1, 3, 5], 500, 700, 2, 44100, 0.75)

        msg = { :info => @stamp,
                :type => "empty", 
                :message => "Success!"}

        respond_to do |format|
            format.html
            format.json  { render :json => msg } 
        end   

    end


    def char_array

        worker = SonifizerWorker.new()
        @audio_data = worker.worker_make_tone_64(200, 0.5, 44100, 0.75, 1000)

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

