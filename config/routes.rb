Rails.application.routes.draw do
  get 'current_conditions/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'current_conditions#index'
end
