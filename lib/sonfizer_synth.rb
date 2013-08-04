module SonifizerSynth

    def twoPI 
        (2 * Math::PI) 
    end
    module_function :twoPI
    public :twoPI

    def linspace(lowNum, highNum, numSamples)
        lowNum = lowNum.to_f
        highNum = highNum.to_f
        numSamples = numSamples.to_f

        aToB = (0...(numSamples)).to_a
        dif = highNum - lowNum
        aToB.map do |sample|
            ((sample/(numSamples-1)) * dif) + lowNum
        end
    end
    module_function :linspace
    public :linspace


    def cumsum(vect)
        cumSum = 0
        vect = vect.map do|sample|  
            cumSum = cumSum + sample
        end
        return vect
    end
    module_function :cumsum
    public :cumsum
    

    def normalize(tone, newMax = 0.98 )
        maxVal = tone.max {|a,b| a.abs <=> b.abs }
        tone.map{|sample| newMax*(sample/maxVal)}
    end
    module_function :normalize
    public :normalize


    def applyFadeIn(tone, sampsIn)
        ramp = linspace(0.0, 1.0, sampsIn.to_f)
        ramp.each_with_index { |sample, indx| tone[indx] *= sample }
        tone
    end
    module_function :applyFadeIn
    public :applyFadeIn


    def applyFadeOut(tone, sampsIn)
        ramp = linspace(0.0, 1.0, sampsIn.to_f)
        vectLeng = tone.count
        ramp.each_with_index { |sample, indx| tone[vectLeng-indx-1] *= sample }
        tone
    end
    module_function :applyFadeOut
    public :applyFadeOut


    def applyFades(tone, numSamples)
        tone = applyFadeOut(tone, numSamples.to_f)
        tone = applyFadeIn(tone, numSamples.to_f)
        return tone
    end
    module_function :applyFades
    public :applyFades


    def timeGen(seconds, fs)
        linspace(0, seconds-(1/fs), seconds*fs);
    end
    module_function :timeGen
    public :timeGen


    def makeTone(freq, seconds, fs=44100, amplitude=0.99)
        timeVect = timeGen(seconds, fs)
        phase = timeVect.map{|sample| sample * twoPI * freq }
        tone = phase.map{|sample|  (amplitude * Math.sin(sample)).to_f}
        return tone
    end
    module_function :makeTone
    public :makeTone

    def makeSlideTone(startFreq, endFreq, seconds, fs=44100, amplitude=0.99)
        freqVector = linspace(startFreq, endFreq, (fs * seconds))
        phase = cumsum(freqVector.map{|sample| sample/fs * twoPI})
        tone = phase.map{|sample|  (amplitude * Math.sin(sample)).to_f}
        return tone
    end
    module_function :makeSlideTone
    public :makeSlideTone

    def makeDataTone(data_array, low_freq, high_freq, seconds, fs=44100, amplitude=0.99)
        data_array = data_array.map{|k| k.to_f}
        low_freq = low_freq.to_f
        high_freq = high_freq.to_f
        seconds = seconds.to_f
        amplitude = amplitude.to_f

        data_length = data_array.length
        samples_per_data_point = seconds*fs / data_length
        max_point = data_array.max
        freq_range = high_freq - low_freq
        data_array = data_array.map do |data_point| 
            freq_range * (data_point/max_point) + low_freq
        end
        previous_data_point = data_array[0]
        freqVector = []
        data_array.map do |data_point|
            freqVector << linspace(previous_data_point, data_point, samples_per_data_point)
            previous_data_point = data_point
        end
        freqVector.flatten!
        phase = cumsum(freqVector.map{|sample| sample/fs * twoPI})
        tone = phase.map{|sample|  (amplitude * Math.sin(sample)).to_f}
        return tone
    end
    module_function :makeSlideTone
    public :makeSlideTone


end
