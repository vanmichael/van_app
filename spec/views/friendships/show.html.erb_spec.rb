require 'spec_helper'

describe "friendships/show" do
  before(:each) do
    @friendship = assign(:friendship, stub_model(Friendship,
      :user_id => "",
      :create => "Create",
      :destroy => "Destroy"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Create/)
    rendered.should match(/Destroy/)
  end
end
