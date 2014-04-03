require 'spec_helper'

describe "contacts/edit" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :user_id => 1,
      :name => "MyString",
      :number => "MyString"
    ))
  end

  it "renders the edit contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do
      assert_select "input#contact_user_id[name=?]", "contact[user_id]"
      assert_select "input#contact_name[name=?]", "contact[name]"
      assert_select "input#contact_number[name=?]", "contact[number]"
    end
  end
end
