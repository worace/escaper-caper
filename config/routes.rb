EscaperCaper::Application.routes.draw do
  require 'resque/server'

  root :to => "escapes#index"

  resources :escapes, :only => [:index, :show]

  mount Resque::Server, :at => "/resque"
end
