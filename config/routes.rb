EscaperCaper::Application.routes.draw do
  require 'resque/server'

  root :to => "escape_picker#show"

  resources :escapes, :only => [:index, :show]

  mount Resque::Server, :at => "/resque"
end
