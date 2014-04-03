require 'spec_helper'

describe "Benutzer-Seite" do

  subject { page }

  let(:admin) { FactoryGirl.create(:admin) }

  describe "Benutzer-Übersicht" do

    before(:each) do
      FactoryGirl.create(:user)
      sign_in admin
      visit users_path
    end
    it "works" do
      get users_path
      response.status.should be(200)
    end
  end
end