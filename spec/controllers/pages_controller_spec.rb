require 'spec_helper'

describe PagesController do
  let( :page ) { create :page, home_page: true }

  context 'render page' do
    before( :each ) do
      page.should be_persisted
      get :show, page: page.slug, section: page.section.slug
    end

    it "response should be sucessful" do
      response.should be_success
    end

    it "should render show" do
      response.should render_template( :show )
    end

    it "should render show for homepage" do
      get :home
      response.should be_success
      response.should render_template( :show )
    end
  end
end
