require "spec_helper"

class TestClass
    include AudioBase64
end

describe AudioBase64 do

    describe "gen_uri_audio_data" do
        it "responses as class method" do
          TestClass.new.should respond_to(:gen_uri_audio_data)
        end
        it "responses as module function" do
          AudioBase64.should respond_to(:gen_uri_audio_data)
        end
    end
end
