require 'spec_helper'

describe "friends/index" do
  before(:each) do
    assign(:friends, [
      stub_model(Friend,
        :friend_username => "Friend Username",
        :user => nil
      ),
      stub_model(Friend,
        :friend_username => "Friend Username",
        :user => nil
      )
    ])
  end

  it "renders a list of friends" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Friend Username".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
