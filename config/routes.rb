Rails.application.routes.draw do
  root 'welcome#index'

  get 'case' => 'case#index'

  get 'self_adopted' => 'self_adopted#index'
end
