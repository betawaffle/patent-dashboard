class ApplicationController < ActionController::Base
  helper :all
  helper_method :application_title, :controller_title, :description
  helper_method :locale, :title
  helper_method :include_blueprint?, :include_prototype?, :include_scriptaculous?, :include_mootools?, :include_analytics?
  
  filter_parameter_logging :password
  protect_from_forgery
  
  before_filter :set_locale
  
protected
  def application_title
    I18n.translate("application.title", :default => File.basename(RAILS_ROOT).titleize)
  end
  
  def controller_title
    I18n.translate("#{controller_name}.title", :default => controller_name.titleize)
  end
  
  def description
    I18n.translate("#{controller_name}.description", :default => 'Indescribably Good')
  end
  
  def include_blueprint?
    true
  end
  
  def include_prototype?
    false
  end
  
  def include_scriptaculous?
    false
  end
  
  def include_mootools?
    false
  end
  
  def include_analytics?
    false
  end
  
  def locale
    I18n.locale
  end
  
  def title(options = nil)
    if options.is_a? Hash
      @title_options ||= {}
      @title_options.merge!(options)
      
      nil
    else
      options = @title_options.merge(:application => application_title, :controller => controller_title)
      options[:controller_singular] = options[:controller].singularize
      options[:default] = [:"application.#{action_name}.title", action_name.titleize]
      
      I18n.translate("#{controller_name}.#{action_name}.title", options)
    end
  end
  
private
  def authenticate
    authenticate_or_request_with_http_digest(title) do |username, password|
      true #username == USERNAME && Digest::SHA1.hexdigest(password) == PASSWORD
    end
  end
  
  def set_locale
    I18n.locale = params[:locale]
  end
end
