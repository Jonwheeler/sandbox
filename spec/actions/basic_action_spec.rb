require "spec_helper"

describe Sandbox::Actions::BasicAction do
  let(:action) { Sandbox::Actions::BasicAction.new }

  it "raises an exception if #call is not defined" do
    expect{ action.call }.to raise_error "Must be implemented"
  end
end
