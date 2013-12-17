require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :wall_post => "MyText",
      :wall_id => "",
      :user => nil
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "textarea#post_wall_post[name=?]", "post[wall_post]"
      assert_select "input#post_wall_id[name=?]", "post[wall_id]"
      assert_select "input#post_user[name=?]", "post[user]"
    end
  end
end
