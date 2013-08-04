include WaveFile

module WaveHandler

    def writeWavefile(tone, fs, local_path)
        format = Format.new(:mono, :pcm_16, fs)
        writer = Writer.new(local_path, format)
        buffer = Buffer.new(tone, Format.new(:mono, :float, fs))
        writer.write(buffer)
        writer.close()

        return local_path
    end
    module_function :writeWavefile
    public :writeWavefile


    def getWaveData(local_path)
        IO.read(local_path) 
    end
    module_function :getWaveData
    public :getWaveData

end
