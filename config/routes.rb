EscaperCaper::Application.routes.draw do
  require 'resque/server'

  mount Resque::Server, :at => "/resque"
end
