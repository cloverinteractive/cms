require 'spec_helper'

describe Section do
  let( :section )     { create :section, name: 'test' }
  let( :subsection )  { create :section, main_section: section }


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

  describe :section_collection do
    before { section.should be_persisted }

    context :new_record do
      it 'should show fetch all sections' do
        new_section = build :section
        new_section.section_collection.should include( [ section.name, section.id ] )
        new_section.section_collection.should eql( Section.section_collection )
      end
    end

    context :exting_record do
      it 'should not fetch self' do
        section.section_collection.should_not include( [ section.name, section.id ] )
        section.section_collection.should eql( [] )
      end
    end
  end

  describe :with_children do
    context :section_page do
      let( :section_page ) { create :page, section: section }

      before( :each ) do
        section.should      be_persisted
        section_page.should be_persisted
      end

      it 'should fetch section and page' do
        new_section, new_subsection, page = *Section.with_children( section: section.slug, page: section_page.slug )

        new_section.should be_present
        new_section.should be_kind_of( Section )

        new_subsection.should be_blank

        page.should be_present
        page.should be_kind_of( Page )
      end

      it 'should only fetch section if page name is wrong' do
        new_section, new_subsection, page = *Section.with_children( section: section.slug, page: "#{ section_page.slug }-wrong" )

        new_section.should    be_present
        new_subsection.should be_blank
        page.should           be_blank
      end

      it 'should not fetch anything if section name is wrong' do
        new_section, new_subsection, page = *Section.with_children( section: "#{ section.slug }-wrong", page: section_page.slug )

        new_section.should    be_blank
        new_subsection.should be_blank
        page.should           be_blank
      end
    end

    context :subsection_page do
      let( :section_page ) { create :page, section: subsection }

      before( :each ) do
        section.should       be_persisted
        subsection.should    be_persisted
        section_page.should  be_persisted
      end

      it 'it should fetch section, subsection and page' do
        new_section, new_subsection, page = *Section.with_children( section: section.slug, subsection: subsection.slug, page: section_page.slug )

        new_section.should    be_present
        new_subsection.should be_present
        page.should           be_present
      end

      it 'should not fetch anything if section name is wrong' do
        new_section, new_subsection, page = *Section.with_children( section: "#{ section.slug }-wrong", subsection: subsection.slug, page: section_page.slug )

        new_section.should    be_blank
        new_subsection.should be_blank
        page.should           be_blank
      end

      it 'should not fetch page if subsection name is wrong' do
        new_section, new_subsection, page = *Section.with_children( section: section.slug, subsection: "#{ subsection.slug }-wrong", page: section_page.slug )

        new_section.should    be_present
        new_subsection.should be_blank
        page.should           be_blank
      end
    end
  end
end
