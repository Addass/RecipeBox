json.array!(@favourites_recipes) do |favourites_recipe|
  json.extract! favourites_recipe, :id, :user_id, :recipe_id
  json.url favourites_recipe_url(favourites_recipe, format: :json)
end
