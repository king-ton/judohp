require 'spec_helper'

describe "people/new" do
  before(:each) do
    assign(:person, stub_model(Person,
      :last_name => "MyString",
      :first_name => "MyString",
      :gender => false,
      :birth_place => "MyString",
      :street => "MyString",
      :zip => 1,
      :city => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", people_path, "post" do
      assert_select "input#person_last_name[name=?]", "person[last_name]"
      assert_select "input#person_first_name[name=?]", "person[first_name]"
      assert_select "input#person_gender[name=?]", "person[gender]"
      assert_select "input#person_birth_place[name=?]", "person[birth_place]"
      assert_select "input#person_street[name=?]", "person[street]"
      assert_select "input#person_zip[name=?]", "person[zip]"
      assert_select "input#person_city[name=?]", "person[city]"
      assert_select "input#person_user_id[name=?]", "person[user_id]"
    end
  end
end
