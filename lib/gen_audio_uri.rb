require "base64"
 
def gen_uri_audio_data(wave_data)
  data = Base64.strict_encode64(wave_data)
  data_string = "'data:audio/wav;base64,%s'" % data
end
