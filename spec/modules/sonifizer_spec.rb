require "spec_helper"


class TestClass
    include SonifizerSynth
end

describe SonifizerSynth do

  describe "linspace" do

    it "found test" do
        TestClass.new.foo
    end

    describe "linspace" do
      it "has correct number of samples" do
        TestClass.new.linspace(0, 1, 4).length().should == 4
        TestClass.new.linspace(0, 1, 5).length().should == 5
      end
      it "starts with the correct value" do
        start_value = 0
        vect = TestClass.new.linspace(start_value, 1, 4)
        vect.first().should == 0
      end
      it "ends with the correct value" do
        end_value = 1
        vect = TestClass.new.linspace(0, end_value, 4)
        vect.last().should == end_value
      end
    end

  end

end

