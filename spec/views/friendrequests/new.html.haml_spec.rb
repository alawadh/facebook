require 'spec_helper'

describe "friendrequests/new" do
  before(:each) do
    assign(:friendrequest, stub_model(Friendrequest,
      :futurefriend => "MyString",
      :user => nil
    ).as_new_record)
  end

  it "renders new friendrequest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", friendrequests_path, "post" do
      assert_select "input#friendrequest_futurefriend[name=?]", "friendrequest[futurefriend]"
      assert_select "input#friendrequest_user[name=?]", "friendrequest[user]"
    end
  end
end
