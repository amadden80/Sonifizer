module SonifizerSynth

    def foo
        p 'foo'
    end

    def twoPI 
        (2 * Math::PI) 
    end

    def linspace(lowNum, highNum, numSamples)
        lowNum = lowNum.to_f
        highNum = highNum.to_f
        numSamples = numSamples.to_f

        aToB = (0...(numSamples)).to_a
        dif = highNum - lowNum
        aToB.map do |sample|
            ((sample/numSamples-1) * dif) + lowNum
        end
    end

    def cumsum(vect)
        cumSum = 0
        vect = vect.map do|sample|  
            cumSum = cumSum + sample
        end
        return vect
    end

    def normalize(tone, newMax = 0.98 )
        maxVal = tone.max {|a,b| a.abs <=> b.abs }
        tone.map{|sample| newMax*(sample/maxVal)}
    end


    def applyFadeIn(tone, sampsIn)
        ramp = linspace(0.0, 1.0, sampsIn.to_f)
        ramp.each_with_index { |sample, indx| tone[indx] *= sample }
        tone
    end

    def applyFadeOut(tone, sampsIn)
        ramp = linspace(0.0, 1.0, sampsIn.to_f)
        vectLeng = tone.count
        ramp.each_with_index { |sample, indx| tone[vectLeng-indx-1] *= sample }
        tone
    end

    def applyFades(numSamples)
        applyFadeOut(numSamples.to_f)
        applyFadeIn(numSamples.to_f)
    end

    def timeGen(seconds, fs)
        linspace(0, seconds-(1/fs), seconds*fs);
    end

    def makeTone(freq, seconds, fs=44100, amplitude=0.99)
        timeVect = timeGen(seconds, fs)
        phase = timeVect.map{|sample| sample/fs * twoPI * freq}
        tone = phase.map{|sample|  (amplitude * Math.sin(sample)).to_f}
        return tone
    end

    def makeSlideTone(startFreq, endFreq, seconds, fs=44100, amplitude=0.99)
        freqVector = linspace(startFreq, endFreq, (fs * seconds))
        phase = cumsum(freqVector.map{|sample| sample/fs * twoPI})
        tone = phase.map{|sample|  (amplitude * Math.sin(sample)).to_f}
        return tone
    end

end
