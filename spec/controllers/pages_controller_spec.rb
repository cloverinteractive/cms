require 'spec_helper'

describe PagesController do
  before :each do
    @page = Factory.create :page, :home_page => true
    get :show, :page => @page.url_name, :section => @page.section.url_name
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
