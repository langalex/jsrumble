class ChangesController < ApplicationController
  def index
    @changes = Page.recent_changes.paginate :page => params[:page]
  end
end