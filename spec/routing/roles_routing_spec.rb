require "spec_helper"

describe RolesController do
  describe "routing" do

    it "routes to #index" do
      get("/" + I18n.t('activerecord.models.role').downcase).should route_to("roles#index")
    end

    it "routes to #new" do
      get("/" + I18n.t('activerecord.models.role').downcase + "/" + I18n.t('views.new').downcase).should route_to("roles#new")
    end

    it "routes to #show" do
      get("/" + I18n.t('activerecord.models.role').downcase + "/1").should route_to("roles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/" + I18n.t('activerecord.models.role').downcase + "/1/" + I18n.t('views.edit').downcase).should route_to("roles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/" + I18n.t('activerecord.models.role').downcase).should route_to("roles#create")
    end

    it "routes to #update" do
      put("/" + I18n.t('activerecord.models.role').downcase + "/1").should route_to("roles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/" + I18n.t('activerecord.models.role').downcase + "/1").should route_to("roles#destroy", :id => "1")
    end

  end
end