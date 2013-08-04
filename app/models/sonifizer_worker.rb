
include SonifizerSynth
include WaveHandler
include AudioBase64

class SonifizerWorker

    attr_accessor :audio_text, :tone, :filename, :path

    def initialize(filename="temp_wavefile")
        @tone = []
        @audio_text = ""
        @filename = filename.gsub('.wav', '')
        @path = Rails.root.join("././public/audio").join("#{filename}.wav")
    end

    def worker_get_audio_data()
        data = getWaveData(@path)
        @audio_text = gen_uri_audio_data(data)
    end

    def worker_make_tone_64(freq, seconds, fs=44100, amplitude=0.99, fade_samples=100)
        @tone = makeTone(freq, seconds, fs, amplitude)
        @tone = applyFades(@tone, fade_samples)
        @path = writeWavefile(@tone, fs, @path)
        self.worker_get_audio_data()
    end

    def worker_make_slide_tone_64(start_freq, end_freq, seconds, fs=44100, amplitude=0.99, fade_samples=100)
        @tone = makeSlideTone(start_freq, end_freq, seconds, fs, amplitude)
        @tone = applyFades(@tone, fade_samples)
        @path = writeWavefile(@tone, fs, @path)
        self.worker_get_audio_data()
    end

    def worker_make_data_tone_64(data_array, low_freq, high_freq, seconds, fs=44100, amplitude=0.99, fade_samples=100)
        @tone = makeDataTone(data_array, low_freq, high_freq, seconds, fs=44100, amplitude=0.99)
        @tone = applyFades(@tone, fade_samples)
        @path = writeWavefile(@tone, fs, @path)
        self.worker_get_audio_data()
    end

    def worker_make_string_tone_64(data_array, low_freq, high_freq, seconds, fs=44100, amplitude=0.99, fade_samples=100)
        @tone = makeDataTone(data_array, low_freq, high_freq, seconds, fs=44100, amplitude=0.99)
        @tone = applyFades(@tone, fade_samples)
        @path = writeWavefile(@tone, fs, @path)
        self.worker_get_audio_data()
    end


end

