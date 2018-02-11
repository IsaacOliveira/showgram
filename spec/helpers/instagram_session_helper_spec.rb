require 'rails_helper'

RSpec.describe InstagramSessionHelper, type: :helper do
  describe '#log_in' do

    let(:user){ instance_double("User", :to_session => double )}
    it 'sets session token form user' do
      helper.log_in(user)
      expect(session[:user_session]).to be == user.to_session
    end
  end

  describe '#current_user' do
    let(:user_session){ double}
    it 'gets user by session token' do
      session[:user_session] = user_session
      expect(User).to receive(:build_from_session).with(user_session)
      helper.current_user
    end
  end

  describe 'logged_in?' do
    context 'has current_user'
    before do
      session[:user_session] = double
    end

    it 'returns true' do
      expect(helper.logged_in?).to be_truthy
    end

    context 'has not current_user' do
      before do
        session[:user_session] = nil
      end
      it 'returns false' do
        expect(helper.logged_in?).to be_falsy
      end
    end
  end

  describe 'log_out' do
    it 'deletes the session' do
      expect(session).to receive(:delete).with(:user_session)
      helper.log_out
    end

    let(:user){ instance_double("User", :to_session => double )}
    it 'sets current user to nil' do
      helper.log_in(user)
      helper.log_out
      expect(helper.instance_variable_get(:@current_user)).to be == nil
    end
  end
end