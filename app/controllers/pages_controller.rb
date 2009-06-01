class PagesController < ApplicationController
  before_filter :parse_id
  
  before_filter :find_page, :except => :index
  before_filter :find_pages,  :only => :index
  
  def index
  end
  
  def show
    if @page.content.nil?
      redirect_to edit_page_path
    end
  end
  
  def edit
    if @page.content.nil?
      render :new
    else
      render :edit
    end
  end
  
  def update
    @page.update_attributes!(params[:page])
    
    flash[:success] = t('flash.updated', :name => @page.name)
    
    redirect_to @page
  end
  
  def destroy
    @page.destroy
    
    flash[:success] = t('flash.deleted', :name => @page.name)
    
    redirect_to pages_path
  end
  
protected
  def title
    I18n.translate()
  end
  
private
  def find_page
    if id = params[:id]
      @page = Page.find(id)
    elsif name = params[:name]
      @page = Page.find_by_namespace_and_name(params[:namespace], name)
    elsif attributes = params[:page]
      @page = Page.new(attributes)
    else
      @page = Page.new
    end
  end
  
  def find_pages
    @pages = Page.all
  end
  
  def parse_id
    slug = params.delete(:id)
    
    if slug =~ /\A[1-9][0-9]*\z/
      params[:id] = slug
    elsif slug =~ /\A#{Page::SLUG_FORMAT}\z/
      params[:namespace], params[:name] = $1, $2
    else
      params[:slug] = slug
    end
  end
end
