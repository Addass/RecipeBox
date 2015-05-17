class UserRecipesController < ApplicationController
  def new
  end
  def index
  	@user_recipes = current_user.recipes
  end
end
