require 'spec_helper'

describe "contacts/index" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact,
        :user_id => 1,
        :name => "Name",
        :number => "Number"
      ),
      stub_model(Contact,
        :user_id => 1,
        :name => "Name",
        :number => "Number"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
  end
end
