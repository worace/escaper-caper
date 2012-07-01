EscaperCaper::Application.routes.draw do
  require 'resque/server'

  root :to => "parent_categories#index"

  resources :parent_categories, :only => [:show]

  resource  :escape_picker, :controller => "escape_picker", :path => "escape_picker", :only => [:show, :create]

  resources :escapes, :only => [:index, :show]

  mount Resque::Server, :at => "/resque"
end
