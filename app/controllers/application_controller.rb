# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem

  protect_from_forgery
  filter_parameter_logging :password
  before_filter :load_navigation, :load_sidebar
  
  
  private
  
  def load_navigation
    @navigation = Page.find_by_wiki_title 'navigation'
  end
  
  def load_sidebar
    @sidebar = Page.find_by_wiki_title 'sidebar'
  end
  
  def check_logged_in
    redirect_to pages_path if logged_in?
  end
end
