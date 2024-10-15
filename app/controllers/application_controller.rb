class ApplicationController < ActionController::Base
      # Prevent access to ActiveAdmin if the user is not an admin
  def authenticate_active_admin_user!
    authenticate_user! # Devise's method to authenticate users
    unless current_user.admin?
      flash[:alert] = "You are not authorized to access this page."
      redirect_to(new_user_registration_path)
    end
    end
  end
  