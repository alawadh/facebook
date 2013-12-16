require 'spec_helper'

describe "friendrequests/show" do
  before(:each) do
    @friendrequest = assign(:friendrequest, stub_model(Friendrequest,
      :futurefriend => "Futurefriend",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Futurefriend/)
    rendered.should match(//)
  end
end
