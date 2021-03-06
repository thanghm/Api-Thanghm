FootballApi::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  mount API::Base => '/api'
  mount GrapeSwaggerRails::Engine => '/api_docs'
 
end
