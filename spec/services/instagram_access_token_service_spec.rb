require 'rails_helper'

RSpec.describe InstagramAccessTokenService, type: :model do

  before do
    stub_const("APP_CONFIG::INSTAGRAM::ACCESS_TOKEN_URL", access_url)
    stub_const("APP_CONFIG::INSTAGRAM::APP_REDIRECT_URL", redirect_url)
    stub_const("APP_CONFIG::INSTAGRAM::GRANT_TYPE", grant_type)
    stub_const("APP_CONFIG::INSTAGRAM::CLIENT_SECRET", client_secret)
    stub_const("APP_CONFIG::INSTAGRAM::CLIENT_ID", client_id)
  end

  describe "#request_token" do
    let(:code){ "test_code" }
    let(:access_url){ "www.test.com" }
    let(:redirect_url){ double }
    let(:grant_type){ double }
    let(:client_secret){ double }
    let(:client_id){ double }
    let(:response_body){ double }
    let(:response){ double(body: response_body) }

    it "post to instagram with the correct params" do
      expected_params = {
        code: code,
        redirect_uri: redirect_url,
        grant_type: grant_type,
        client_secret: client_secret,
        client_id: client_id
      }
      uri = URI(access_url)
      expect(Net::HTTP).to receive(:post_form).with(uri, expected_params).and_return(response)
      allow(JSON).to receive(:parse)
      InstagramAccessTokenService.new(code).request_token
    end

    it "parses the response json" do
      allow(Net::HTTP).to receive(:post_form).and_return(response)
      expect(JSON).to receive(:parse).with(response_body)
      InstagramAccessTokenService.new(code).request_token
    end

  end
end