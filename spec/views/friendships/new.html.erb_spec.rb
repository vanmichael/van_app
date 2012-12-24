require 'spec_helper'

describe "friendships/new" do
  before(:each) do
    assign(:friendship, stub_model(Friendship,
      :user_id => "",
      :create => "MyString",
      :destroy => "MyString"
    ).as_new_record)
  end

  it "renders new friendship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => friendships_path, :method => "post" do
      assert_select "input#friendship_user_id", :name => "friendship[user_id]"
      assert_select "input#friendship_create", :name => "friendship[create]"
      assert_select "input#friendship_destroy", :name => "friendship[destroy]"
    end
  end
end
