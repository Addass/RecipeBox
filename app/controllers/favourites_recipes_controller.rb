class FavouritesRecipesController < ApplicationController
  before_action :set_favourites_recipe, only: [:show, :edit, :update, :destroy]

  # GET /favourites_recipes
  # GET /favourites_recipes.json
  def index
    @favourites_recipes = FavouritesRecipe.all
  end

  # GET /favourites_recipes/1
  # GET /favourites_recipes/1.json
  def show
  end

  # GET /favourites_recipes/new
  def new
    @favourites_recipe = FavouritesRecipe.new
  end

  # GET /favourites_recipes/1/edit
  def edit
  end

  # POST /favourites_recipes
  # POST /favourites_recipes.json
  def create
    @favourites_recipe = FavouritesRecipe.new
    @favourites_recipe.user_id = current_user.id
    @favourites_recipe.recipe_id = params[:recipe_id]
    respond_to do |format|
      if @favourites_recipe.save
        format.html { redirect_to @favourites_recipe, notice: 'Favourites recipe was successfully created.' }
        format.json { render :show, status: :created, location: @favourites_recipe }
      else
        format.html { render :new }
        format.json { render json: @favourites_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favourites_recipes/1
  # PATCH/PUT /favourites_recipes/1.json
  def update
    respond_to do |format|
      if @favourites_recipe.update(favourites_recipe_params)
        format.html { redirect_to @favourites_recipe, notice: 'Favourites recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @favourites_recipe }
      else
        format.html { render :edit }
        format.json { render json: @favourites_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourites_recipes/1
  # DELETE /favourites_recipes/1.json
  def destroy
    @favourites_recipe.destroy
    respond_to do |format|
      format.html { redirect_to favourites_recipes_url, notice: 'Favourites recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourites_recipe
      @favourites_recipe = FavouritesRecipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favourites_recipe_params
      params.require(:favourites_recipe).permit(:recipe_id)
    end
end
