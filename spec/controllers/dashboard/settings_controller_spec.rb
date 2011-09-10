require 'spec_helper'

describe Dashboard::SettingsController do
  before :each do
    @user     = Factory.create :user
    @setting  = Factory.create :setting, :name => 'test_setting', :value => 'true'
  end

  describe "when user is admin" do
    before :each do
      login_as @user, :admin
    end

    describe "GET index" do
      before :each do
        get :index
      end

      it "should be successful" do
        response.should be_success
      end

      it "should assign @settings" do
        assigns( :settings ).should == [ @setting ]
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
        get :edit, :id => @setting
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
        post :create, :setting => Factory.attributes_for( :setting )
      end

      it "should create setting" do
        Setting.count.should == 2
      end

      it "should assign @setting" do
        assigns( :setting ).should be_kind_of( Setting )
      end

      it "should redirect to index" do
        response.should redirect_to( dashboard_settings_path )
      end

      it "should render new should anything go wrong" do
        post :create, :setting => Factory.attributes_for( :setting, :name => '' )
        response.should render_template( :new )
      end
    end

    describe "PUT update" do
      before :each do
        put :update, :id => @setting, :setting => { :name => 'batman' }
      end

      it "should update setting" do
        assigns( :setting ).should == @setting.reload
      end

      it "should assign @setting" do
        assigns( :setting ).should be_kind_of( Setting )
      end

      it "should redirect to index" do
        response.should redirect_to( dashboard_settings_path )
      end

      it "should render edit should anything go wrong" do
        put :update, :id => @setting, :setting => { :name => '' }
        response.should render_template( :edit )
      end
    end

    describe "DELETE destroy" do
      before :each do
        delete :destroy, :id => @setting
      end

      it "should destroy setting" do
        Setting.count.should == 0
      end

      it "should redirect to index" do
        response.should redirect_to( dashboard_settings_path )
      end

      it "should not destroy if setting is not destroyable" do
        setting = Factory.create :setting
        setting.destroyable = false
        setting.save!

        delete :destroy, :id => setting
        Setting.count.should == 1
        Setting.first.should == setting
      end
    end
  end

  describe "when user is not admin" do
    describe "when user is not logged in" do
      it "should redirect to login when using GET" do
        actions = %w/index new edit/
        actions.each do |action|
          get action, :id => @setting
          response.should redirect_to( new_user_session_path )
        end
      end

      it "should redirect to login when using POST" do
        post :create, :setting => Factory.attributes_for( :setting )
        response.should redirect_to( new_user_session_path )
      end

      it "should redirect to login when using PUT" do
        put :update, :id => @setting, :setting => { :name => 'batman' }
        response.should redirect_to( new_user_session_path )
      end

      it "should redirect to login when using DELETE" do
        delete :destroy, :id => @setting
        response.should redirect_to( new_user_session_path )
      end
    end
  end
end
