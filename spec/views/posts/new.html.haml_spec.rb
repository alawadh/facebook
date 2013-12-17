require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :wall_post => "MyText",
      :wall_id => "",
      :user => nil
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "textarea#post_wall_post[name=?]", "post[wall_post]"
      assert_select "input#post_wall_id[name=?]", "post[wall_id]"
      assert_select "input#post_user[name=?]", "post[user]"
    end
  end
end
