ActionController::Routing::Routes.draw do |map|
  map.resources :pages, :as => 'wiki', :except => [:new, :create, :destroy]
  map.resources :page_revisions, :as => 'history', :only => [:index, :show], :path_prefix => 'wiki/:page_id'
  
  map.javascript 'javascripts/:path.js',  :controller => 'javascripts', :action => 'show', :format => 'js', :requirements => { :path => /[a-z\/]+/ }
  map.stylesheet 'stylesheets/:path.css', :controller => 'stylesheets', :action => 'show', :format => 'css', :requirements => { :path => /[a-z\/]+/ }
  
  map.resources :clients
  map.resources :forms
  map.resources :directories
  map.resources :websites
  map.resources :blogs
  
  #map.patentlyo 'feeds/patentlyo', :controller => 'feeds', :action => 'show', :url => 'http://feeds.feedburner.com/PatentlyO'
  
  map.feed 'feeds/:name', :controller => 'feeds', :action => 'show', :requirements => { :name => /\w+/ }
  map.feed 'feeds/:url', :controller => 'feeds', :action => 'show', :requirements => { :url => /http:\/\/.+/ }
  
  map.wiki 'wiki/Home', :controller => 'pages', :action => 'show', :id => 'Home'
  map.root :controller => 'dashboard', :action => 'show'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  # map.connect ':controller/:action/:id.:format'
end
