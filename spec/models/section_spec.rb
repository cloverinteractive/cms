require 'spec_helper'

describe Section do
   let( :section ) { create :section, name: 'test' }

  describe "name" do
    it "should be present" do
       new_section = build :section, name: nil
       new_section.should be_invalid
    end

    it "should be unique" do
      section.should be_persisted

      new_section = build :section, name: section.name
      new_section.should be_invalid
    end
  end

  it "should have an slug after created" do
    section.slug.should be_present
  end
end
