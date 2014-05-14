require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/" + I18n.t('activerecord.models.user').downcase).should route_to("users#index")
    end

    it "routes to #new" do
      get("/" + I18n.t('activerecord.models.user').downcase + "/" + I18n.t('views.new').downcase).should route_to("users#new")
    end

    it "routes to #show" do
      get("/" + I18n.t('activerecord.models.user').downcase + "/1").should route_to("users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/" + I18n.t('activerecord.models.user').downcase + "/1/" + I18n.t('views.edit').downcase).should route_to("users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/" + I18n.t('activerecord.models.user').downcase).should route_to("users#create")
    end

    it "routes to #update" do
      put("/" + I18n.t('activerecord.models.user').downcase + "/1").should route_to("users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/" + I18n.t('activerecord.models.user').downcase + "/1").should route_to("users#destroy", :id => "1")
    end
    
    it "routes to #activate" do
      get("/" + I18n.t('activerecord.models.user').downcase + "/" + I18n.t('views.user.activate.title').downcase + "/1").should route_to("users#activate", :activation_token => "1")
    end

  end
end