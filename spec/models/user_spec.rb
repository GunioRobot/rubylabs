require 'spec_helper'

describe User do

  before :each do
    @attr = {:name => "Jenus", :email => "jenus@jlabs.de"}
  end

  it "should have create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
   no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "should reject names that are too short" do
    short_name = "a" * 3
    short_name_user = User.new(@attr.merge(:name => short_name))
    short_name_user.should_not be_valid
  end


  it "should accept valid email address" do
    addresses = %w[user@foo.com The_USER@foo.bar.org example.user@foo.net]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email address" do
    addresses = %w[@foo.com user@foo.bar. user[at].foobar.com]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email address" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end


  it "should reject email with duplicate address up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@att)
    user_with_duplicate_email.should_not be_valid
  end


end
