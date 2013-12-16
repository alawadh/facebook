require 'spec_helper'

describe "friends/new" do
  before(:each) do
    assign(:friend, stub_model(Friend,
      :friend_username => "MyString",
      :user => nil
    ).as_new_record)
  end

  it "renders new friend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", friends_path, "post" do
      assert_select "input#friend_friend_username[name=?]", "friend[friend_username]"
      assert_select "input#friend_user[name=?]", "friend[user]"
    end
  end
end
