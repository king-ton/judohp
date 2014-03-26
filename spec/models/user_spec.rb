# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_token  :string(255)
#

require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "example@tonifreitag.de", password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  #  it { should respond_to(:admin) }

  it { should be_valid }
  #  it { should_not be_admin }

  #  describe "mit dem Admin-Attribut auf 'true' setzen" do
  #    before { @user.toggle!(:admin) }

  #    it { should be_admin }
  #  end

  ##################################################
  # Alle benötigten Werte Vorhanden

  describe "wenn kein Name vorhanden" do
    before { @user.name = " "}
    it { should_not be_valid }
  end

  describe "wenn keine E-Mail vorhanden" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "wenn kein Passwort vorhanden" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  ##################################################
  # Alle Werte valid

  describe "wenn das E-Mail-Format ungueltig ist" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "wenn das E-Mail-Format gueltig ist" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "E-Mail-Adresse mit unterschiedlichen Buchstabengroessen" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }
    it "es sollten nur Kleinbuchstaben gespeichert werden" do
      @user.email = mixed_case_email
      @user.save
      @user.reload.email.should == mixed_case_email.downcase
    end
  end

  # Duplikate verboten
  describe "wenn eine E-Mail-Adresse bereits vorhanden ist" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "wenn das Passwort nicht mit der Wiederholung uebereinstimmt" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "wenn die Passwort-Wiederholung Null ist" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  #  # Laenge der Werte
  #  describe "wenn der Name zulang ist" do
  #    before { @user.name = "a" * 51 }
  #    it { should_not be_valid }
  #  end

  describe "mit einem zu kurzen Passwort" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  ##################################################
  # Methoden-Test

  describe "Rueckgabewert der 'authenticate'-Methode" do

    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "mit einem gueltigen Passwort" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "mit einem ungueltigen Passwort" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "Erinnergung-Token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end
