require 'spec_helper'

describe 'Mitglieder-Seiten' do

  subject { page }

  before(:all) do
    50.times { FactoryGirl.create(:user) }
  end

  before(:each) do
    sign_in_admin
  end

  describe "Übersicht" do
    before(:each) do
      visit members_path
    end

    it { should have_title(I18n.t('views.member.index.title')) }
    it { should have_content(I18n.t('views.member.index.title')) }

    it "jedes Mitglied soll aufgelistet sein" do
      Member.all.each do |member|
        should have_selector('td', text: member.name)
      end
    end

    describe "unberechtigte Nutzer haben keinen Zugriff" do
      before(:each) do
        sign_in_user
        visit users_path
      end

      it { should_not have_title(I18n.t('views.user.index.title')) }
      it { should have_title(I18n.t('views.session.new.title')) }
      it { should have_selector('div.alert.alert-danger', text: I18n.t('pundit.error')) }
    end
  end

  describe "Neues Mitglied" do

    before(:each) do
      visit new_member_path
    end

    it { should have_selector('h1', :text => I18n.t('views.member.new.title')) }
    it { should have_title(I18n.t('views.member.new.title')) }

    let(:submit) { I18n.t('views.user.new.action') }

    describe "mit gültigen Informationen" do
      before do
        fill_in "Name",         with: "Toni Freitag"
        fill_in "E-Mail",       with: "toni@tonifreitag.de"
        fill_in "Passwort",     with: "foobar"
        fill_in "Bestätigung",  with: "foobar"
      end

      it "soll einen Benutzer erstellen" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "nach Speicherung des Benutzers" do
        before { click_button submit }
        let(:user) { User.find_by_email('toni@tonifreitag.de') }

        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: I18n.t('views.user.msg.created')) }

      end
    end

    describe "mit ungültigen Informationen" do
      it "soll kein Mitglied erstellt werden" do
        expect { click_button submit }.not_to change(Member, :count)
      end

      describe "nach Bestätigung" do
        before { click_button submit }

        it { should have_title(I18n.t('views.member.new.title')) }
        it { should have_content(I18n.t('errors.messages.blank')) }
      end
    end

    describe "unberechtigte Nutzer haben keinen Zugriff" do
      before(:each) do
        sign_in user
        visit new_user_path
      end

      it { should_not have_title(I18n.t('views.user.new.title')) }
      it { should have_title(I18n.t('views.session.new.title')) }
      it { should have_selector('div.alert.alert-danger', text: I18n.t('pundit.error')) }

    end
  end

  describe "Benutzer-Detailansicht" do
    let(:user) { FactoryGirl.create(:user) }
    let(:member) { FactoryGirl.create(:member) }
    let(:admin) { FactoryGirl.create(:admin) }
    before do
      sign_in admin
      visit user_path(user)
    end

    it { should have_selector('h1:page-header', :text => user.name) }
    it { should have_title(user.name) }

    describe "unberechtigte Nutzer haben keinen Zugriff" do
      before(:each) do
        sign_in user
        visit user_path(user)
      end

      it { should_not have_title(admin.name) }
      it { should have_title(I18n.t('views.session.new.title')) }
      it { should have_selector('div.alert.alert-danger', text: I18n.t('pundit.error')) }

    end
    describe "Nutzer können ihre eigene Seite anschauen" do
      before(:each) do
        sign_in member
        visit user_path(member)
      end

      it { should have_title(member.name) }
      it { should_not have_title(I18n.t('views.session.new.title')) }
      it { should_not have_selector('div.alert.alert-danger', text: I18n.t('pundit.error')) }

    end
  end

  describe "Benutzer bearbeiten" do
    let(:user) { FactoryGirl.create(:user) }
    let(:member) { FactoryGirl.create(:member) }
    let(:admin) { FactoryGirl.create(:admin) }
    before do
      sign_in admin
      visit edit_user_path(user)
    end

    describe "Seite" do
      it { should have_selector('h1', text: I18n.t('views.user.edit.title')) }
      it { should have_title(I18n.t('views.user.edit.title')) }
    end

    describe "mit gültigen Informationen" do
      let(:new_name) { "Neuer Name" }
      let(:new_email) { "neu@tonifreitag.de" }
      before do
        fill_in 'user_name', with: new_name
        fill_in I18n.t('activerecord.attributes.user.email'), with: new_email
        fill_in I18n.t('activerecord.attributes.user.password'), with: user.password
        fill_in I18n.t('activerecord.attributes.user.password_confirmation'), with: user.password
        click_button I18n.t('views.user.edit.action')
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      specify { user.reload.name.should == new_name }
      specify { user.reload.email.should == new_email }
    end

    describe "unberechtigte Nutzer haben keinen Zugriff" do
      before(:each) do
        sign_in user
        visit edit_user_path(admin)
      end

      it { should_not have_title(I18n.t('views.user.edit.title')) }
      it { should have_title(I18n.t('views.session.new.title')) }
      it { should have_selector('div.alert.alert-danger', text: I18n.t('pundit.error')) }

    end

    describe "Mitglieder dürfen ihr eigenes Profil bearbeiten" do
      before(:each) do
        sign_in member
        visit edit_user_path(member)
      end

      it { should have_title(I18n.t('views.user.edit.title')) }
      it { should_not have_title(I18n.t('views.session.new.title')) }
      it { should_not have_selector('div.alert.alert-danger', text: I18n.t('pundit.error')) }

    end
  end

  describe "Benutzer löschen" do

    let(:user) { FactoryGirl.create(:user) }
    let(:admin) { FactoryGirl.create(:admin) }

    before(:each) do
      sign_in admin
      visit user_path(user)
      visit users_path
    end

    it { should have_selector('a', :href => user_delete_path(user)) }
    it "soll möglich sein einen anderen Benutzer zu löschen" do
      expect { find(user_delete_path(user)).click }.to change(User, :count).by(-1)
    end
    it "aber man kann sich nicht selber löschen" do
      expect { should_not have_link(I18n.t('views.destroy'), href: user_path(admin)) }
    end

    pending "Berechtigung hinzufügen"
  end

end
