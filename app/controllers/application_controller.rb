class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :admin_controller?
  before_action :authenticate_admin!, if: :admin_controller?

  helper_method :admin_controller?

  private

  def admin_controller?
    # !devise_controller? && request.path =~ /^\/admin/
    params[:controller].split("/").first == "admin"
  end

end
