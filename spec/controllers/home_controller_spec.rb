require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    context "logged in?" do
      let(:user){ double }
      let(:use_case){ instance_double("GetUserPictures")}
      it "sets the user and pictures" do
        allow_any_instance_of(InstagramSessionHelper).to receive(:logged_in?).and_return(true)
        expect_any_instance_of(InstagramSessionHelper).to receive(:current_user).and_return(user)
        expect(GetUserPictures).to receive(:new).with(user).and_return(use_case)
        expect(use_case).to receive(:execute)
        get :index
      end
    end

    context "not logged in?" do
      before do
        stub_const("APP_CONFIG::INSTAGRAM::AUTHORIZE_URL", authorize_url)
      end
      let(:authorize_url){ double }
      it "sets the url do get token" do
        allow_any_instance_of(InstagramSessionHelper).to receive(:logged_in?).and_return(false)
        get :index
        expect(assigns(:url)).to be authorize_url
      end
    end
  end

end
