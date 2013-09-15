require 'spec_helper'

describe Dashboard::PagesController do
  let( :user )    { create :user }
  let( :section ) { create :section }
  let( :page )    { create :page, section: section }

  before { page.should be_persisted }

  describe "when user is logged  in" do
    before { sign_in user }

    describe "GET index" do
      before :each do
        get :index
      end

      it "should assign @pages" do
        assigns( :pages ).should include( page )
      end

      it "should be successful" do
        response.should be_success
      end

      it "should render index" do
        response.should render_template( :index )
      end
    end

    describe "GET new" do
      before :each do
        get :new
      end

      it "should assign @page" do
        assigns( :page ).should be_kind_of( Page )
      end

      it "should be successful" do
        response.should be_success
      end

      it "should render new" do
        response.should render_template( :new )
      end
    end

    describe "GET edit" do
      before :each do
        get :edit, id: page
      end

      it "should assign @page" do
        assigns( :page ).should be_kind_of( Page )
      end

      it "should render edit" do
        response.should render_template( :edit )
      end

      it "should be successful" do
        response.should be_success
      end
    end

    describe "POST create" do
      let( :page_attr ) { attributes_for :page, name: 'new page', section_id: section.id }

      before { post :create, page: page_attr }

      it "should redirect to index" do
        response.should redirect_to( dashboard_pages_path )
      end

      it "should create page" do
        assigns( :page ).should be_kind_of( Page )
        Page.count.should eql( 2 )
      end

      it "should render new if anything goes wrong" do
        post :create, page: page_attr.merge( name: page.name )
        response.should render_template( :new )
      end
    end

    describe "PUT update" do
      before :each do
        put :update, id: page, page: { name: 'batman' }
      end

      it "should redirect to index" do
        response.should redirect_to( edit_dashboard_page_path( page.reload ) )
      end

      it "should update @page" do
        assigns( :page ).should eql( page.reload )
      end

      it "should assign @page" do
        assigns( :page ).should be_kind_of( Page )
      end
    end

    describe "DELETE destroy" do
      before :each do
        delete :destroy, id: page
      end

      it "should destroy page" do
        Page.count.should eql( 0 )
      end

      it "should redirect to index" do
        response.should redirect_to( dashboard_pages_path )
      end
    end
  end

  describe "when user is not admin" do
    describe "when user is not logged in" do
      it "should redirect to login when using GET" do
        actions = %w/index new edit/
        actions.each do |action|
          get action, id: page
          response.should redirect_to( new_user_session_path )
        end
      end

      it "should redirect to login when using POST" do
        post :create, page: attributes_for( :page )
        response.should redirect_to( new_user_session_path )
      end

      it "should redirect to login when using PUT" do
        put :update, id: page, page: { name: '' }
        response.should redirect_to( new_user_session_path )
      end

      it "should redirect to login when using DELETE" do
        delete :destroy, id: page
        response.should redirect_to( new_user_session_path )
      end
    end
  end
end
