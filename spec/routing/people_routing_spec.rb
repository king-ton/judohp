require "spec_helper"

describe PeopleController do
  describe "routing" do

    it "routes to #index" do
      get("/" + I18n.t('activerecord.models.person').downcase).should route_to("people#index")
    end

    it "routes to #new" do
      get("/" + I18n.t('activerecord.models.person').downcase + "/" + I18n.t('views.new').downcase).should route_to("people#new")
    end

    it "routes to #show" do
      get("/" + I18n.t('activerecord.models.person').downcase + "/1").should route_to("people#show", :id => "1")
    end

    it "routes to #edit" do
      get("/" + I18n.t('activerecord.models.person').downcase + "/1/" + I18n.t('views.edit').downcase).should route_to("people#edit", :id => "1")
    end

    it "routes to #create" do
      post("/" + I18n.t('activerecord.models.person').downcase).should route_to("people#create")
    end

    it "routes to #update" do
      put("/" + I18n.t('activerecord.models.person').downcase + "/1").should route_to("people#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/" + I18n.t('activerecord.models.person').downcase + "/1").should route_to("people#destroy", :id => "1")
    end

  end
end
