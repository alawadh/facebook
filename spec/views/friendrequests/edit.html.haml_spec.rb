require 'spec_helper'

describe "friendrequests/edit" do
  before(:each) do
    @friendrequest = assign(:friendrequest, stub_model(Friendrequest,
      :futurefriend => "MyString",
      :user => nil
    ))
  end

  it "renders the edit friendrequest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", friendrequest_path(@friendrequest), "post" do
      assert_select "input#friendrequest_futurefriend[name=?]", "friendrequest[futurefriend]"
      assert_select "input#friendrequest_user[name=?]", "friendrequest[user]"
    end
  end
end
