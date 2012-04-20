require 'spec_helper'

describe Dashboard::SectionsController do
  before :each do
    @user     = Factory.create :user
    @section  = Factory.create :section
  end

  describe "when user is logged in" do
    before :each do
      login_as @user
    end

    describe "GET index" do
      before :each do
        get :index
      end

      it "should be successful" do
        response.should be_success
      end

      it "should assign @sections" do
        assigns( :sections ).should == [ @section ]
      end

      it "should render index" do
        response.should render_template( :index )
      end
    end

    describe "GET new" do
      before :each do
        get :new
      end

      it "should be successful" do
        response.should be_success
      end

      it "should assign @section" do
        assigns( :section ).should be_kind_of( Section )
      end

      it "should render new" do
        response.should render_template( :new )
      end
    end

    describe "GET edit" do
      before :each do
        get :edit, :id => @section
      end

      it "should be successfu" do
        response.should be_success
      end

      it "should assign @section" do
        assigns( :section ).should be_kind_of( Section )
      end

      it "should render edit" do
        response.should render_template( :edit )
      end
    end

    describe "POST create" do
      before :each do
        post :create, :section => Factory.attributes_for( :section )
      end

      it "should create new section" do
        Section.count.should == 2
      end

      it "should assign @section" do
        assigns( :section ).should be_kind_of( Section )
      end

      it "should redirect to index" do
        response.should redirect_to( dashboard_sections_path )
      end

      it "should render new should something go wrong" do
        post :create, Factory.attributes_for( :section, :name => '' )
        response.should render_template( :new )
      end
    end

    describe "PUT update" do
      before :each do
        put :update, :id => @section, :section => { :name => 'batman' }
      end

      it "should assign @section" do
        assigns( :section ).should be_kind_of( Section )
      end

      it "should update @section" do
        assigns( :section ).should == @section
      end

      it "should redirect to index" do
        response.should redirect_to( dashboard_sections_path )
      end

      it "should render edit should something go wrong" do
        put :update, :id => @section, :section => { :name => '' }
        response.should render_template( :edit )
      end
    end

    describe "DELETE destroy" do
      before :each do
        delete :destroy, :id => @section
      end

      it "should destroy section" do
        Section.count.should == 0
      end

      it "should redirect to index" do
        response.should redirect_to( dashboard_sections_path )
      end
    end
  end

  describe "when user is not admin" do
    describe "when user is not logged in" do
      it "should redirect to login when using GET" do
        actions = %w/index new edit/
        actions.each do |action|
          get action, :id => @section
          response.should redirect_to( new_user_session_path )
        end
      end

      it "should redirect to login when using POST" do
        post :create, :setting => Factory.attributes_for( :section )
        response.should redirect_to( new_user_session_path )
      end

      it "should redirect to login when using PUT" do
        put :update, :id => @section, :section => { :name => 'batman' }
        response.should redirect_to( new_user_session_path )
      end

      it "should redirect to login when using DELETE" do
        delete :destroy, :id => @section
        response.should redirect_to( new_user_session_path )
      end
    end
  end
end
