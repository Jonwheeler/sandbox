require "spec_helper"

describe Sandbox::Connection do

  let(:connection) { Sandbox::Connection.new }
  let(:base_url)   { "http://some-url.com/api/v1/containers" }

  %i( get post delete ).each do |action|
    before { RestClient.stub(action) { { result: true, name: "foo"} }}
  end

  it "has the correct base url" do
    expect(Sandbox::Connection::BASE_URL)
      .to eq base_url
  end

  describe "#create" do
    let(:config) {{ name: "foo", memory: "512" }}

    it "POSTs to the api with the config" do
      expect(RestClient).to receive(:post)
        .with("#{base_url}/create", config)

      connection.create(config)
    end

    it "returns self" do
      expect(connection.create(config)).to eq connection
    end

    it "assigns resp" do
      connection.create(config)
      expect(connection.resp).to be_a(Hash)
    end
  end

  describe "#destroy" do
    it "calls the api with the VM name" do
      expect(RestClient).to receive(:delete)
        .with("#{base_url}/foo")

      connection.destroy("foo")
    end

    it "returns self" do
      expect(connection.destroy("foo")).to eq connection
    end

    it "assigns resp" do
      connection.destroy("foo")
      expect(connection.resp).to be_a(Hash)
    end
  end

  describe "#info" do
    it "calls the api with the VM name" do
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

  describe "#errors" do
    it "is an empty array by default" do
      expect(connection.errors).to eq []
    end

    it "is empty when there are no errors" do 
      connection.stub(:resp) {{ errors: [] }}
      expect(connection.errors).to eq []
    end

    it "returns the errors from the response" do
      connection.stub(:resp) {{ errors: [{ name: "Name is not available." }] }}
      expect(connection.errors).to include name: "Name is not available." 
    end
  end
end
