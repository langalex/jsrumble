require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  fixtures :users

  before(:all) do
    @controller = PagesController.new
  end
  
  before do
    @navigation = Page.create! :title => 'navigation', :body => '* home'
    @sidebar = Page.create! :title => 'sidebar', :body => 'side'
  end
  
  test "should load the navigation" do
    get :index
    assert_response :success
    assert_equal @navigation, assigns(:navigation)
  end
  
  test "should load the sidebar" do
    get :index
    assert_response :success
    assert_equal @sidebar, assigns(:sidebar)
  end
end
