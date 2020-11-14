class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :admin_controller?
  before_action :authenticate_admin!, if: :admin_controller?

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  helper_method :admin_controller?

  private

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé à réaliser cette action"
    admin_controller? ? redirect_to(admin_root_path) : redirect_to(root_path)
  end

  def admin_controller?
    # !devise_controller? && request.path =~ /^\/admin/
    params[:controller].split("/").first == "admin"
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
