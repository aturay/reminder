class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :authenticate_user!


  private

  def set_locale
    if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
      logger.info I18n.locale = session[:locale] = params[:locale].to_sym
    elsif session[:locale]
      I18n.locale = session[:locale].to_sym
    else
      session[:locale] = I18n.default_locale
    end
  end
end
