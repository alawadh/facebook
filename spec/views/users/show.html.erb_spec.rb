require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "Username",
      :first_name => "First Name",
      :last_name => "Last Name",
      :password => "Password",
      :interests => "MyText",
      :quotes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Username/)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Password/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
