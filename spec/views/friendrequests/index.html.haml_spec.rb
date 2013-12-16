require 'spec_helper'

describe "friendrequests/index" do
  before(:each) do
    assign(:friendrequests, [
      stub_model(Friendrequest,
        :futurefriend => "Futurefriend",
        :user => nil
      ),
      stub_model(Friendrequest,
        :futurefriend => "Futurefriend",
        :user => nil
      )
    ])
  end

  it "renders a list of friendrequests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Futurefriend".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
