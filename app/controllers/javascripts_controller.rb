class JavascriptsController < ApplicationController
  layout false
  
  def show
    headers['Content-Type'] ||= Mime::JS
    
    render :template => "javascripts/#{params[:path]}.js"
  end
end