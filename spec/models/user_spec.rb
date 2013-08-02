require 'spec_helper'

describe User do
  let( :user ) { create :user }

  describe "email" do
    it "must be unique" do
      user.should be_persisted

      new_user = build :user, email: user.email
      new_user.should be_invalid
    end

    it "must have proper format" do
      new_user =  build :user

      %w/invalid_email in@va@lid invalit@..@/.each do |invalid_email|
        new_user.email = invalid_email
        new_user.should be_invalid
      end
    end
  end

  describe "username" do
    it "must be present" do
      user = build :user, username: nil
      user.should be_invalid
    end

    it "must be properly formatted" do
      user = build :user, username: nil

      %w/&*)@user tes!@@k ASc&#))/.each do |invalid_username|
        user.username = invalid_username
        user.should be_invalid
      end
    end
  end
end
