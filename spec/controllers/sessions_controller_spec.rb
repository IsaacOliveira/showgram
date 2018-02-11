require 'rails_helper'

RSpec.describe SessionsController, type: :controller do


  describe "GET show" do
    let(:code){ double }
    let(:user){ double }
    let(:use_case_double){ double }

    it "redirect to root" do
      allow(LoginWithInstagramCode).to receive(:new).and_return(spy)
      allow_any_instance_of(InstagramSessionHelper).to receive(:log_in)
      get :show, params: { code: code }
      expect(response).to redirect_to(root_path)
    end

    it "gets the user from use case" do
      expect(LoginWithInstagramCode).to receive(:new).with("#{code}").and_return(use_case_double)
      expect(use_case_double).to receive(:execute)
      allow_any_instance_of(InstagramSessionHelper).to receive(:log_in)
      get :show, params: { code: code }
    end

    it "login the user" do
      allow(LoginWithInstagramCode).to receive(:new).with("#{code}").and_return(use_case_double)
      allow(use_case_double).to receive(:execute).and_return(user)
      expect_any_instance_of(InstagramSessionHelper).to receive(:log_in).with(user)
      get :show, params: { code: code }
    end
  end

  describe "DELETE destroy" do
    it "redirect to root" do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end

    it "sign out the user" do
      expect_any_instance_of(InstagramSessionHelper).to receive(:log_out)
      delete :destroy
    end
  end

end
