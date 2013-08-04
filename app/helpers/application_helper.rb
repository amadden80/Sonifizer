module ApplicationHelper

    require 'digest/md5'
    def email_hash(email) 
        return Digest::MD5.hexdigest(email.downcase)
    end


    def get_tone_audio_text_file(freq, seconds, fs, amplitude)
        filename = "temp_tone_#{seconds}_#{fs}_#{amplitude}_#{freq}"
        file_path = '././public/audio/'+filename+".wav"
        worker = SonifizerWorker.new(filename)
        if !File.exist?(file_path)
            worker.worker_make_tone_64(freq, seconds, fs, amplitude)
        else
            worker.worker_get_audio_data()
        end
        worker.audio_text
    end

    def get_slide_tone_audio_text_file(start_freq, end_freq, seconds, fs, amplitude)
        filename = "temp_slide_#{seconds}_#{fs}_#{amplitude}_#{start_freq}_#{end_freq}"
        file_path = '././public/audio/'+filename+".wav"
        worker = SonifizerWorker.new(filename)
        if !File.exist?(file_path)
            worker.worker_make_slide_tone_64(start_freq, end_freq, seconds, fs, amplitude)
        else
            worker.worker_get_audio_data()
        end
        worker.audio_text
    end

    def get_data_tone_audio_text_file(data_array, low_freq, high_freq, seconds, fs, amplitude)
        filename = "temp_slide_#{seconds}_#{fs}_#{amplitude}_#{low_freq}_#{high_freq}_#{data_array.first}_#{data_array.last}_#{data_array.length}"
        file_path = '././public/audio/'+filename+".wav"
        worker = SonifizerWorker.new(filename)
        if !File.exist?(file_path)
            worker.worker_make_data_tone_64(data_array, low_freq, high_freq, seconds, fs, amplitude)
        else
            worker.worker_get_audio_data()
        end
        worker.audio_text
    end

    def get_string_tone_audio_text_file(string, low_freq, high_freq, seconds, fs, amplitude)
        data_array = []
        string.each_byte do |c|
            data_array << c
        end
        filename = "temp_slide_#{seconds}_#{fs}_#{amplitude}_#{low_freq}_#{high_freq}_#{string}_#{data_array.length}"
        file_path = '././public/audio/'+filename+".wav"
        worker = SonifizerWorker.new(filename)
        if !File.exist?(file_path)
            worker.worker_make_data_tone_64(data_array, low_freq, high_freq, seconds, fs, amplitude)
        else
            worker.worker_get_audio_data()
        end
        worker.audio_text
    end

    

    
end

