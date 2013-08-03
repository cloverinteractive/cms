require 'spec_helper'

describe Dashboard::SettingsController do
  let( :user )    { create :user }
  let( :setting ) { create :setting, name: 'test_setting', value: 'true' }

  describe "when user is logged in" do
    before { sign_in user }

    describe "GET index" do
      before :each do
        get :index
      end

      it "should be successful" do
        response.should be_success
      end

      it "should assign @settings" do
        assigns( :settings ).should include( setting )
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

      it "should assign @setting" do
        assigns( :setting ).should be_kind_of( Setting )
      end

      it "should render new" do
        response.should render_template( :new )
      end
    end

    describe "GET edit" do
      before :each do
        get :edit, id: setting
      end

      it "should be successful" do
        response.should be_success
      end

      it "should assign @setting" do
        assigns( :setting ).should be_kind_of( Setting )
      end

      it "should render edit" do
        response.should render_template( :edit )
      end
    end

    describe "POST create" do
      before :each do
        expect { post :create, setting: attributes_for( :setting ) }.to change { Setting.count }.by 1
      end

      it "should assign @setting" do
        assigns( :setting ).should be_kind_of( Setting )
      end

      it "should redirect to index" do
        response.should redirect_to( dashboard_settings_path )
      end

      it "should render new should anything go wrong" do
        post :create, setting: attributes_for( :setting, name: nil )
        response.should render_template( :new )
      end
    end

    describe "PUT update" do
      before :each do
        put :update, id: setting, setting: { name: 'batman' }
      end

      it "should update setting" do
        assigns( :setting ).should eql( setting.reload )
      end

      it "should assign @setting" do
        assigns( :setting ).should be_kind_of( Setting )
      end

      it "should redirect to index" do
        response.should redirect_to( dashboard_settings_path )
      end

      it "should render edit should anything go wrong" do
        put :update, id: setting, setting: { name: nil }
        response.should render_template( :edit )
      end
    end

    describe "DELETE destroy" do
      before { delete :destroy, id: setting }

      it "should destroy setting" do
        Setting.count.should eql( 0 )
      end

      it "should redirect to index" do
        response.should redirect_to( dashboard_settings_path )
      end

      it "should not destroy if setting is not destroyable" do
        setting.destroyable = false
        setting.save!

        expect { delete :destroy, id: setting }.to_not change { Setting.count }
      end
    end
  end

  describe "when user is not admin" do
    describe "when user is not logged in" do
      it "should redirect to login when using GET" do
        actions = %w/index new edit/
        actions.each do |action|
          get action, id: setting
          response.should redirect_to( new_user_session_path )
        end
      end

      it "should redirect to login when using POST" do
        post :create, setting: attributes_for( :setting )
        response.should redirect_to( new_user_session_path )
      end

      it "should redirect to login when using PUT" do
        put :update, id: setting, setting: { name: 'batman' }
        response.should redirect_to( new_user_session_path )
      end

      it "should redirect to login when using DELETE" do
        delete :destroy, id: setting
        response.should redirect_to( new_user_session_path )
      end
    end
  end
end
