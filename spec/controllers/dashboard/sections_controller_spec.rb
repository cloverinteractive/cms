require 'spec_helper'

describe Dashboard::SectionsController do
  let( :user )    { create :user }
  let( :section ) { create :section }

  describe "when user is logged in" do
    before :each do
      section.should be_persisted
      sign_in user
    end

    describe "GET index" do
      before :each do
        get :index
      end

      it "should be successful" do
        response.should be_success
      end

      it "should assign @sections" do
        assigns( :sections ).should include( section )
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
        get :edit, id: section
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
        expect { post :create, section: attributes_for( :section ) }.to change { Section.count }.by 1
      end

      it "should assign @section" do
        assigns( :section ).should be_kind_of( Section )
      end

      it "should redirect to index" do
        response.should redirect_to( dashboard_sections_path )
      end

      it "should render new should something go wrong" do
        post :create, attributes_for( :section, name: '' )
        response.should render_template( :new )
      end
    end

    describe "PUT update" do
      before { section.should be_persisted }

      context :update_successful do
        before { put :update, id: section, section: { name: 'batman' } }

        it "should assign @section" do
          assigns( :section ).should be_kind_of( Section )
        end

        it "should update @section" do
          assigns( :section ).should eql( section )
        end

        it "should redirect to index" do
          response.should redirect_to( dashboard_sections_path )
        end
      end


      context :update_fails do
        it "should render edit should something go wrong" do
          put :update, id: section, section: { name: '' }
          response.should render_template( :edit )
        end
      end
    end

    describe "DELETE destroy" do
      before :each do
        expect { delete :destroy, id: section }.to change { Section.count }.by -1
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
          get action, id: section
          response.should redirect_to( new_user_session_path )
        end
      end

      it "should redirect to login when using POST" do
        post :create, setting: attributes_for( :section )
        response.should redirect_to( new_user_session_path )
      end

      it "should redirect to login when using PUT" do
        put :update, id: section, section: { name: 'batman' }
        response.should redirect_to( new_user_session_path )
      end

      it "should redirect to login when using DELETE" do
        delete :destroy, id: section
        response.should redirect_to( new_user_session_path )
      end
    end
  end
end
