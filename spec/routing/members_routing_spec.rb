require "spec_helper"

describe MembersController do
  describe "routing" do

    it "routes to #index" do
      get("/" + I18n.t('activerecord.models.member').downcase).should route_to("members#index")
    end

    it "routes to #new" do
      get("/" + I18n.t('activerecord.models.member').downcase + "/" + I18n.t('views.new').downcase).should route_to("members#new")
    end

    it "routes to #show" do
      get("/" + I18n.t('activerecord.models.member').downcase + "/1").should route_to("members#show", :id => "1")
    end

    it "routes to #edit" do
      get("/" + I18n.t('activerecord.models.member').downcase + "/1/" + I18n.t('views.edit').downcase).should route_to("members#edit", :id => "1")
    end

    it "routes to #create" do
      post("/" + I18n.t('activerecord.models.member').downcase).should route_to("members#create")
    end

    it "routes to #update" do
      put("/" + I18n.t('activerecord.models.member').downcase + "/1").should route_to("members#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/" + I18n.t('activerecord.models.member').downcase + "/1").should route_to("members#destroy", :id => "1")
    end

  end
end