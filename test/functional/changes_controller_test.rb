require 'test_helper'

class ChangesController; def rescue_action(e) raise e end; end

class ChangesControllerTest < ActionController::TestCase
  context 'index' do
    before(:all) do
      @controller = ChangesController.new
      
      @page = Page.create!(:title => "Hello world", :body => "Thanks for all the fish", :user_id => 1)
      @page.update_attributes :title => 'moin'
    end
    
    test "should show all diffs" do
      get :index
      assert_response :success
      assert @response.body.include?('moin')
      assert @response.body.include?('Hello world')
    end
  end
end
