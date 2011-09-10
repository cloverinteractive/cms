require 'spec_helper'

describe User do
  before :each do
    @user = Factory.create :user
  end

  describe "email" do
    it "must be unique" do
      user = Factory.build :user, :email => @user.email
      user.should be_invalid
    end

    it "must have proper format" do
      user =  Factory.build :user
      %w/invalid_email in@va@lid invalit@..@/.each do |invalid_email|
        user.email = invalid_email
        user.should be_invalid
      end
    end
  end

  describe "username" do
    it "must be present" do
      user = Factory.build :user, :username => ''
      user.should be_invalid
    end

    it "must be properly formatted" do
      user = Factory.build :user, :username => ''

      %w/&*)@user tes!@@k ASc&#))/.each do |invalid_username|
        user.username = invalid_username
        user.should be_invalid
      end
    end
  end
end
