require 'RedCloth'
require 'BlueCloth'

module PagesHelper
  def link_to_page(label, page)
    if page.content.nil?
      link_to label, edit_page_path(page), :class => 'broken'
    else
      link_to label, page
    end
  end
  
  def render_page(page)
    eval(page.compile)
  end
end
