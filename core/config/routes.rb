::Refinery::Application.routes.draw do
  filter(:refinery_locales) if defined?(RoutingFilter::RefineryLocales) # optionally use i18n.
	scope(:module => Refinery) do
  	root :to => 'pages#home'

	  match 'wymiframe(/:id)', :to => 'refinery/fast#wymiframe', :as => :wymiframe
	
	  scope(:path => 'refinery', :as => 'admin', :module => Refinery::Admin) do
	    # root :to => 'dashboard#index'
	    resources :dialogs, :only => :show
	  end
	
	  match '/refinery/update_menu_positions', :to => 'admin/refinery_core#update_plugin_positions'
	
	  match '/sitemap.xml' => 'sitemap#index', :defaults => { :format => 'xml' }
	
	  # Marketable URLs should be appended to routes by the Pages Engine.
	  # Catch all routes should be appended to routes by the Core Engine.
	end
end
