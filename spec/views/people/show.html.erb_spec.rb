require 'spec_helper'

describe "people/show" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :last_name => "Last Name",
      :first_name => "First Name",
      :gender => false,
      :birth_place => "Birth Place",
      :street => "Street",
      :zip => 1,
      :city => "City",
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    rendered.should match(/First Name/)
    rendered.should match(/false/)
    rendered.should match(/Birth Place/)
    rendered.should match(/Street/)
    rendered.should match(/1/)
    rendered.should match(/City/)
    rendered.should match(/2/)
  end
end
