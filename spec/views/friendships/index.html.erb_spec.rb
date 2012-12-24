require 'spec_helper'

describe "friendships/index" do
  before(:each) do
    assign(:friendships, [
      stub_model(Friendship,
        :user_id => "",
        :create => "Create",
        :destroy => "Destroy"
      ),
      stub_model(Friendship,
        :user_id => "",
        :create => "Create",
        :destroy => "Destroy"
      )
    ])
  end

  it "renders a list of friendships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Create".to_s, :count => 2
    assert_select "tr>td", :text => "Destroy".to_s, :count => 2
  end
end
