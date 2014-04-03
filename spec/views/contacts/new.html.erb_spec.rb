require 'spec_helper'

describe "contacts/new" do
  before(:each) do
    assign(:contact, stub_model(Contact,
      :user_id => 1,
      :name => "MyString",
      :number => "MyString"
    ).as_new_record)
  end

  it "renders new contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contacts_path, "post" do
      assert_select "input#contact_user_id[name=?]", "contact[user_id]"
      assert_select "input#contact_name[name=?]", "contact[name]"
      assert_select "input#contact_number[name=?]", "contact[number]"
    end
  end
end
