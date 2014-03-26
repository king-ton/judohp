require 'spec_helper'

describe "Authentifikation" do

  subject { page }

  describe "Anmelden-Seite" do
    before { visit signin_path }

    it { should have_selector('h1', text: I18n.t('views.session.new.title')) }
    it { should have_title(I18n.t('views.session.new.title')) }
  end

  describe "Anmelden" do
    before { visit signin_path }

    describe "mit ungültigen Informationen" do
      before { click_button I18n.t('views.session.new.action') }

      it { should have_title(I18n.t('views.session.new.title')) }
      it { should have_selector('div.alert.alert-danger', text: 'Ungültig') }

      describe "nach dem Besuch einer anderen Seite" do
        #before { click_link I18n.t('activerecord.models.user') }
        before { click_link I18n.t('views.session.new.action') }
        it { should_not have_selector('div.alert.alert-danger') }
      end
    end

    describe "mit gültigen Informationen" do
      let(:user) { FactoryGirl.create(:user) }

      before do
        fill_in I18n.t('activerecord.attributes.user.email'), with: user.email
        fill_in I18n.t('activerecord.attributes.user.password'), with: user.password
        click_button I18n.t('views.session.new.action')
      end

      it { should have_title(user.name) }
      it { should have_link('Profil', href: user_path(user)) }
      it { should have_link('Einstellungen', href: edit_user_path(user)) }
      it { should have_link(I18n.t('views.session.destroy.action'), href: signout_path) }
      it { should_not have_link(I18n.t('views.session.new.action'), href: signin_path) }
    end
  end
end
