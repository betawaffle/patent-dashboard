class PageReference < ActiveRecord::Base
  belongs_to :page_revision # Referencing
  belongs_to :page          # Referenced
end
