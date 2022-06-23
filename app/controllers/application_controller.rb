class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :set_locale_from_domain

  private
  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&.to_s).include?(parsed_locale)? parsed_locale : nil
  end

  def set_locale_from_domain
    detected_locale = Rails.application.config.hosts.key(request.host)
    I18n.locale = I18n.available_locales.map(&:to_s).include?(detected_locale) ?
    detected_locale : I18n.default_locale
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
