require "base64"

module AudioBase64 

    def gen_uri_audio_data(wave_data)
      data = Base64.strict_encode64(wave_data)
      data_string = "data:audio/wav;base64,#{data}"
      data_string
    end
    module_function :gen_uri_audio_data
    public :gen_uri_audio_data

end
