require 'spec_helper'

describe Dashboard::UsersController do
  let( :user ) { create :user }

  describe "when user is logged in" do
    before { sign_in user }

    describe "GET index" do
      before :each do
        get :index
      end

      it "should be successful" do
        response.should be_success
      end

      it "should assign @users" do
        assigns( :users ).should include( user )
      end

      it "should render index" do
        response.should render_template( :index )
      end
    end

    describe "DELETE destroy" do
      before :each do
        expect { delete :destroy, id: user }.to change { User.count }.by -1
      end

      it "should redirect to index" do
        response.should redirect_to( dashboard_users_path )
      end
    end
  end

  describe "when user is not admin" do
    describe "when user is not logged in" do
      it "should redirect to login when using GET" do
        get :index
        response.should redirect_to( new_user_session_path )
      end

      it "should redirect to login when using DELETE" do
        delete :destroy, id: user
        response.should redirect_to( new_user_session_path )
      end
    end
  end
end
