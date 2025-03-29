# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @accounts = current_user.accounts.includes(:locations)
    @locations = current_user.locations
    
    # Initialize @partners as an empty array if nil would be returned
    @partners = current_user.admin? ? Partner.all : []
    
    @recent_services = ServiceRecord.joins(location: :account)
                                  .where(accounts: { user_id: current_user.id })
                                  .order(date: :desc)
                                  .limit(5)
  end
end