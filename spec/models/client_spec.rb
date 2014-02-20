require_relative '../spec_helper'

describe "A test" do
  it "this should be a test"

  it "client should work" do
   client = Client.create(name: "foo")
   expect(client.name).to eq "foo"
   expect(client.id).to_not be_nil 
  end
end
