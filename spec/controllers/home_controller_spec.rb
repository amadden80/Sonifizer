require "spec_helper"

describe HomeController do

  describe "GET #index" do

    it "root responds successfully " do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end

end


