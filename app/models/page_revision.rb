class PageRevision < ActiveRecord::Base
  serialize :compiled, String
  
  belongs_to :page
  
  has_many :references, :class_name => 'PageReference', :dependent => :destroy
  has_many :referenced_pages, :through => :references, :source => :page
  
  before_save :compile
  
  def compile
    pages = Hash.new { |h, k| h[k] = Page.find_or_create_by_namespace_and_name(*k) }
    
    src = content.inspect
    src.gsub!(Page::LINK_FORMAT) do |m|
      namespace, name, label = $1, $2, $3
      namespace = page.namespace if namespace.nil?
      
      pages[[namespace, name]]
      
      label ||= name.titleize
      
      %(" + link_to_page('#{label}', Page.find_by_namespace_and_name(#{namespace.inspect}, #{name.inspect})) + ")
    end
    
    self.referenced_pages = pages.values
    self.compiled = "RedCloth.new(#{src}).to_html"
  end
  
# def parse_content
#   pages = Hash.new { |h, k| h[k] = Page.find_or_create_by_namespace_and_name(*k) }
#   content.scan(Page::LINK_FORMAT) { |namespace, name| pages[[namespace, name]] }
#   
#   self.referenced_pages = pages.values
# end
end
