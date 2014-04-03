require 'spec_helper'

describe "contacts/show" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :user_id => 1,
      :name => "Name",
      :number => "Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Number/)
  end
end
