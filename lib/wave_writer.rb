# include WaveFile

# def writeWave

#         filename = @filename.gsub('.wav', '')
#         local_path = @path
#         local_path += "#{filename}.wav"

#         format = Format.new(:mono, :pcm_16, @fs)
#         writer = Writer.new(local_path, format)
#         buffer = Buffer.new(@tone, Format.new(:mono, :float, @fs))
#         writer.write(buffer)
#         writer.close()

#         return local_path

#     end