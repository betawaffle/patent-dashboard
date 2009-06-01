class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :namespace
      t.string :name, :null => false
      
      t.text :content
      
      t.timestamps
    end
    
    create_table :page_references do |t|
      t.references :page
      t.references :page_revision
      t.timestamps
    end
    
    create_table :page_revisions do |t|
      t.text :content, :null => false
      t.text :compiled
      
      t.references :page
      t.references :person
      t.timestamps
    end
    
    Page.create(:name => 'Home')
  end

  def self.down
    drop_table :pages
    drop_table :page_references
    drop_table :page_revisions
  end
end
