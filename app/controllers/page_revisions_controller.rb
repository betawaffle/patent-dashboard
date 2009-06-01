class PageRevisionsController < ApplicationController
  before_filter :parse_page_id
  
  before_filter :find_page
  before_filter :find_page_revision, :except => :index
  before_filter :find_page_revisions,  :only => :index
  
  def index
  end
  
  def show
  end
  
private
  def find_page
    if page_id = params[:page_id]
      @page = Page.find(page_id)
    elsif page_name = params[:page_name]
      @page = Page.find_by_namespace_and_name(params[:page_namespace], page_name)
    end
  end
  
  def find_page_revision
    @page_revision = @page.page_revisions.find(params[:id])
  end
  
  def find_page_revisions
    @page_revisions = @page.page_revisions
  end
  
  def parse_page_id
    page_slug = params.delete(:page_id)
    
    if page_slug =~ /\A[1-9][0-9]*\z/
      params[:page_id] = slug
    elsif page_slug =~ /\A#{Page::SLUG_FORMAT}\z/
      params[:page_namespace], params[:page_name] = $1, $2
    else
      params[:page_slug] = page_slug
    end
  end
end