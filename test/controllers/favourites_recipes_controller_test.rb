require 'test_helper'

class FavouritesRecipesControllerTest < ActionController::TestCase
  setup do
    @favourites_recipe = favourites_recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favourites_recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favourites_recipe" do
    assert_difference('FavouritesRecipe.count') do
      post :create, favourites_recipe: { recipe_id: @favourites_recipe.recipe_id, user_id: @favourites_recipe.user_id }
    end

    assert_redirected_to favourites_recipe_path(assigns(:favourites_recipe))
  end

  test "should show favourites_recipe" do
    get :show, id: @favourites_recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favourites_recipe
    assert_response :success
  end

  test "should update favourites_recipe" do
    patch :update, id: @favourites_recipe, favourites_recipe: { recipe_id: @favourites_recipe.recipe_id, user_id: @favourites_recipe.user_id }
    assert_redirected_to favourites_recipe_path(assigns(:favourites_recipe))
  end

  test "should destroy favourites_recipe" do
    assert_difference('FavouritesRecipe.count', -1) do
      delete :destroy, id: @favourites_recipe
    end

    assert_redirected_to favourites_recipes_path
  end
end
