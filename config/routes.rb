Rails.application.routes.draw do
  resources :test


  resources :words do
  	collection do
  		get 'characters'
  		get 'english'
  		get 'pinyin'
  	end
  end

  root "words#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
