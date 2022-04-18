class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @menu_dashboard = true
    @dashboard_notifications = nil
  end

end
