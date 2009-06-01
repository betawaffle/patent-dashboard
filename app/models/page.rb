class Page < ActiveRecord::Base
  NAMESPACES = %w(Client Help Test User)
  NAME_FORMAT = /([A-Z][a-zA-Z]*)/
  SLUG_FORMAT = /(?:(#{NAMESPACES.join('|')}):)?#{NAME_FORMAT}/
  LINK_FORMAT = /\[\[#{SLUG_FORMAT}(?:\|(.+?))?\]\]/
  
  has_many :back_references, :class_name => 'PageReference'
  has_many :back_referenced_revisions, :through => :back_references, :source => :page_revision
  
  has_many :page_revisions, :order => 'created_at ASC', :dependent => :destroy
  
  validates_inclusion_of  :namespace, :in => [nil] + NAMESPACES
  validates_format_of     :name,      :with => NAME_FORMAT
  validates_uniqueness_of :name, :scope => :namespace
  
  before_update :create_revision_from_content, :if => :content_changed?
  
  def back_referenced_pages
    back_referenced_revisions.collect(&:page).uniq
  end
  
  def compiled
    page_revisions.last.compile
  end
  
  def orphan?
    back_references.length.zero?
  end
  
  def to_param
    namespace ? "#{namespace}:#{name}" : "#{name}"
  end
  
private
  def create_revision_from_content
    self.page_revisions.create(:content => content)
  end
end
