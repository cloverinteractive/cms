require 'spec_helper'

describe Setting do
  let( :theme ) { create :setting, name: 'theme', value: 'clover', destroyable: false }

  describe "name" do
    it "must be present" do
      setting = build :setting, name: nil
      setting.should be_invalid
    end

    it "must be unique" do
      theme.should be_persisted

      setting = build :setting, name: 'theme'
      setting.should be_invalid
    end

    it "shold be properly formatted" do
      setting = build :setting, name: 'badly formatted name '
      setting.should be_invalid
    end
  end

  describe "value" do
    it "must be present" do
      setting = build :setting, value: ''
      setting.should be_invalid
    end
  end
end
