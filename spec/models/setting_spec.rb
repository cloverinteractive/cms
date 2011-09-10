require 'spec_helper'

describe Setting do
  before :each do
    @theme = Factory.create :setting, :name => 'theme', :value => 'clover', :destroyable => false
  end

  describe "name" do
    it "must be present" do
      setting = Factory.build :setting, :name => ''
      setting.should be_invalid
    end

    it "must be unique" do
      setting = Factory.build :setting, :name => 'theme'
      setting.should be_invalid
    end

    it "shold be properly formatted" do
      setting = Factory.build :setting, :name => 'badly formatted name '
      setting.should be_invalid
    end
  end

  describe "value" do
    it "must be present" do
      setting = Factory.build :setting, :value => ''
      setting.should be_invalid
    end
  end

  it "should not delete non destroyable settings" do
    @theme.delete.should be_false
  end
end
