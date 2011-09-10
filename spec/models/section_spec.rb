require 'spec_helper'

describe Section do
  before :each do
    @section = Factory :section, :name => "test"
  end

  describe "name" do
    it "should be present" do
       new_section = Section.new
       new_section.should be_invalid
    end

    it "should be unique" do
      section = Factory.build :section, :name => "test"
      section.should be_invalid

     section.name = 'new_name'
      section.should be_valid
    end
  end

  it "should have an url_name after created" do
    @section.url_name.should be_present
  end
end
