require "spec_helper"

describe ApiController do

  describe "GET #index" do

    describe "HTML request" do

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

      # before :each do
      #   get :index, :format => :json
      # end

      # it "api responds successfully to javascript request" do
      #   pending
      #   # expect(response).to be_success
      # end

    end

  end

end


