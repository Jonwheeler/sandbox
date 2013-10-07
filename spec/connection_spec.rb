require "sandbox/connection"

describe Sandbox::Connection do

  let(:connection) { Sandbox::Connection.new }
  let(:base_url)   { "http://some-url.com/api/v1/containers" }

  %i( get put delete ).each do |action|
    before { RestClient.stub(action) { { result: true, name: "foo"} }}
  end

  it "has the correct base url" do
    expect(Sandbox::Connection::BASE_URL)
      .to eq base_url
  end

  describe "#create" do
  end

  describe "#destroy" do

  end

  describe "#info" do
    it "calls the api with a GET request" do
      expect(RestClient).to receive(:get)
        .with("#{base_url}/foo")

      connection.info("foo")
    end

    it "returns self" do
      expect(connection.info("foo")).to eq connection
    end

    it "assigns resp" do
      connection.info("foo")
      expect(connection.resp).to be_a(Hash)
    end
  end

  describe "#result" do

    context "response has successful result" do
      it "returns true" do
        connection.stub(:resp) {{ result: true }}
        expect(connection.success?).to be true
      end
    end

    context "response has unsuccessful result" do
      it "returns false" do
        connection.stub(:resp) {{ result: false }}
        expect(connection.success?).to be false 
      end
    end
  end
end
