require "spec_helper"

describe ApiController do

  describe "GET #index" do

    describe "Basic HTML request" do
      before :each do
        get :index
      end

      it "api responds successfully to html request with index template" do
        expect(response).to be_success
        expect(response.status).to eq(200)
        expect(response).to render_template("index")
      end
    end

    describe "JSON request" do

      before :each do
        get :index, :format => :json
      end

      it "api responds successfully to javascript request" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      describe "Info/Type in json response" do

        it "stamp includes api Sonifizer" do
          parsed_body = JSON.parse(response.body)
          parsed_body["info"]["api"].should == "Sonifizer"
        end

        it "type is appropriate" do
          parsed_body = JSON.parse(response.body)
          parsed_body["type"].should == "empty"
        end

      end

    end  # describe "Basic JSON request" do
  end # describe "GET #index" do


  describe "POST #username_responder" do

    before :each do
      post :username_responder, {:format => :json, username: "test_name"}
    end

    it "api responds successfully to javascript request" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    describe "Info/Type in json response" do

      it "stamp includes api Sonifizer" do
        parsed_body = JSON.parse(response.body)
        parsed_body["info"]["api"].should == "Sonifizer"
      end

      it "type is appropriate" do
        parsed_body = JSON.parse(response.body)
        parsed_body["type"].should == "Character Array"
      end

    end


  end # describe "GET #char_array" do




end # describe ApiController do






