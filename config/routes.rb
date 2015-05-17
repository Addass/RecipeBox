Rails.application.routes.draw do

  	resources :favourites_recipes
  	resources :user_recipes
  	resources :categories
	devise_for :users
	resources :recipes

	resources :recipes do
	  put :favourite, on: :member
	end

	root "recipes#index"
end
