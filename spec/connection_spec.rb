require "sandbox/connection"

describe Sandbox::Connection do
  it "has the correct base url" do
    expect(Sandbox::Connection::BASE_URL)
      .to eq "http://some-url.com/api/v1/containers"
  end
end
