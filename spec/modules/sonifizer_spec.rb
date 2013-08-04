require "spec_helper"


class TestClass
    include SonifizerSynth
end

describe SonifizerSynth do

  describe "linspace" do
    it "responses as class method" do
      TestClass.new.should respond_to(:linspace)
    end
    it "responses as module function" do
      SonifizerSynth.should respond_to(:linspace)
    end
    it "has correct number of samples - method function" do
      SonifizerSynth.linspace(0, 1, 4).length().should == 4
      SonifizerSynth.linspace(0, 1, 5).length().should == 5
    end
    it "starts with the correct value - method function" do
      start_value = 0
      vect = SonifizerSynth.linspace(start_value, 1, 4)
      vect.first().should == 0
    end
    it "ends with the correct value - method function" do
      end_value = 1
      vect = SonifizerSynth.linspace(0, end_value, 4)
      vect.last().should == end_value
    end
  end

  describe "cumsum" do
    it "responses as class method" do
      TestClass.new.should respond_to(:cumsum)
    end
    it "responses as module function" do
      SonifizerSynth.should respond_to(:cumsum)
    end
    it "has correct number of samples" do
      vect = [2, 1, 4]
      SonifizerSynth.cumsum(vect).length().should == vect.length()
    end
    it "starts with the correct value" do
      vect = [2, 1, 4]
      SonifizerSynth.cumsum(vect).first().should == 2
    end
    it "ends with the correct value" do
      vect = [2, 1, 4]
      SonifizerSynth.cumsum(vect).last().should == 7
    end
  end

  describe "normalize" do
    it "responses as class method" do
      TestClass.new.should respond_to(:normalize)
    end
    it "responses as module function" do
      SonifizerSynth.should respond_to(:normalize)
    end  
    it "has correct number of samples" do
      vect = [0.2, 0.1, 0.4]
      SonifizerSynth.normalize(vect, 1).length().should == vect.length()
    end
    it "starts with the correct value" do
      vect = [0.2, 0.1, 0.4]
      SonifizerSynth.normalize(vect, 1).first().should == 0.5
    end
    it "ends with the correct value" do
      vect = [0.2, 0.1, 0.4]
      SonifizerSynth.normalize(vect, 1).last().should == 1
    end
    it "can change max value" do
      vect = [0.2, 0.1, 0.4]
      SonifizerSynth.normalize(vect, 5).last().should == 5
      SonifizerSynth.normalize(vect, 0.01).last().should == 0.01
      SonifizerSynth.normalize(vect, 100).last().should == 100
    end
    
  end



  describe "applyFadeIn" do
    it "responses as class method" do
      TestClass.new.should respond_to(:applyFadeIn)
    end
    it "responses as module function" do
      SonifizerSynth.should respond_to(:applyFadeIn)
    end 
    it "has correct number of samples" do
      vect = [1, 1, 1]
      SonifizerSynth.applyFadeIn(vect, 3).length().should == vect.length()
    end
    it "starts with the correct value" do
      vect = [1, 1, 1]
      SonifizerSynth.applyFadeIn(vect, 3).first().should == 0
    end
    it "ends with the correct value" do
      vect = [1, 1, 1]
      SonifizerSynth.applyFadeIn(vect, 3).last().should == 1
    end
  end


  describe "applyFadeOut" do
    it "responses as class method" do
      TestClass.new.should respond_to(:applyFadeOut)
    end
    it "responses as module function" do
      SonifizerSynth.should respond_to(:applyFadeOut)
    end 
    it "has correct number of samples" do
      vect = [1, 1, 1]
      SonifizerSynth.applyFadeOut(vect, 3).length().should == vect.length()
    end
    it "starts with the correct value" do
      vect = [1, 1, 1]      
      SonifizerSynth.applyFadeOut(vect, 3).first().should == 1
    end
    it "ends with the correct value" do
      vect = [1, 1, 1]
      SonifizerSynth.applyFadeOut(vect, 3).last().should == 0
    end
  end
  
  describe "applyFades" do
    it "responses as class method" do
      TestClass.new.should respond_to(:applyFades)
    end
    it "responses as module function" do
      SonifizerSynth.should respond_to(:applyFades)
    end 
    it "has correct number of samples" do
      vect = [1, 1, 1, 1, 1, 1]
      SonifizerSynth.applyFades(vect, 3).length().should == vect.length()
    end
    it "starts with the correct value" do
      vect = [1, 1, 1, 1, 1, 1]      
      SonifizerSynth.applyFades(vect, 3).first().should == 0
    end
    it "ends with the correct value" do
      vect = [1, 1, 1, 1, 1, 1]
      SonifizerSynth.applyFades(vect, 3).last().should == 0
    end
    it "center is correct value" do
      vect = [1, 1, 1, 1, 1, 1, 1]
      SonifizerSynth.applyFades(vect, 3)[3].should == 1
    end
  end

  describe "timeGen" do
    it "responses as class method" do
      TestClass.new.should respond_to(:timeGen)
    end
    it "responses as module function" do
      SonifizerSynth.should respond_to(:timeGen)
    end 
    it "has correct number of samples" do
      SonifizerSynth.timeGen(1, 44100).length().should == 44100
    end
    it "starts with the correct value" do
      SonifizerSynth.timeGen(1, 44100).first().should == 0
    end
    it "ends with the correct value" do
      SonifizerSynth.timeGen(1, 44100).last().should == 1-(1/44100)
    end
  end

  describe "makeTone" do
    it "responses as class method" do
      TestClass.new.should respond_to(:makeTone)
    end
    it "responses as module function" do
      SonifizerSynth.should respond_to(:makeTone)
    end 
    it "has correct number of samples" do
      SonifizerSynth.makeTone(1000, 1, 44100, 1).length().should == 44100
      SonifizerSynth.makeTone(1000, 1, 44101, 1).length().should == 44101
    end
    it "starts with the correct value" do
      SonifizerSynth.makeTone(1000, 1, 44100, 1).first().should == 0
    end
    it "uses default values" do
      SonifizerSynth.makeTone(1000, 1).length().should == 44100
    end
  end
  
  describe "makeSlideTone" do
    it "responses as class method" do
      TestClass.new.should respond_to(:makeSlideTone)
    end
    it "responses as module function" do
      SonifizerSynth.should respond_to(:makeSlideTone)
    end 
    it "has correct number of samples" do
      SonifizerSynth.makeSlideTone(100, 1000, 1, 44100, 1).length().should == 44100
      SonifizerSynth.makeSlideTone(100, 1000, 1, 44101, 1).length().should == 44101
    end
    it "uses default values" do
      SonifizerSynth.makeSlideTone(100, 1000, 1).length().should == 44100
    end
  end


end


      # describe "class method" do
      # end
      # describe "module function" do
      # end