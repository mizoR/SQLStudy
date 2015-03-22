Rails.application.routes.draw do
  root 'welcome#index'

  get 'case' => 'case#index'
end
