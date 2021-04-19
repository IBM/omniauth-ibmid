require "spec_helper"

RSpec.describe OmniAuth::Strategies::Ibmid do
  subject { OmniAuth::Strategies::Ibmid.new({}) }

  context "client options" do
    it "should have correct site" do
      expect(subject.options.client_options.site).to eq(
        "https://login.ibm.com"
      )
    end

    it "should have correct authorization url path" do
      expect(subject.options.client_options.authorize_url).to eq(
        "https://login.ibm.com/oidc/endpoint/default/authorize"
      )
    end

    it "should have correct token url path" do
      expect(subject.options.client_options.token_url).to eq(
        "https://login.ibm.com/oidc/endpoint/default/token"
      )
    end
  end
end
