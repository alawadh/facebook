require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :password => "MyString",
      :interests => "MyText",
      :quotes => "MyText"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_username[name=?]", "user[username]"
      assert_select "input#user_first_name[name=?]", "user[first_name]"
      assert_select "input#user_last_name[name=?]", "user[last_name]"
      assert_select "input#user_password[name=?]", "user[password]"
      assert_select "textarea#user_interests[name=?]", "user[interests]"
      assert_select "textarea#user_quotes[name=?]", "user[quotes]"
    end
  end
end