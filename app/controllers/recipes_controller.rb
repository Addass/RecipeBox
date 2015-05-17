class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy, :favourite]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@recipe = Recipe.search(params[:search])
	end

	def show

	end

	def create
		@recipe = current_user.recipes.build(recipe_params)
		@recipe.category_id = params[:category_id]
		if @recipe.save
			redirect_to @recipe, notice: "Successfully created new recipe"
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{|c| [ c.name, c.id ] }
	end

	def favourite
		type = params[:type]
		if type == "favorite"
			current_user.favourites << @recipe
			redirect_to :back, notice: 'You favorited #{@recipe.title}'

		elsif type == "unfavorite"
			current_user.favourites.destroy(@recipe)
			redirect_to :back, notice: 'Unfavorited #{@recipe.title}'

		else
			# Type missing, nothing happens
			redirect_to :back, notice: 'Nothing happened.'
		end
	end

	def update
		@recipe.category_id = params[:category_id]
		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render 'edit'
		end
	end

	def destroy
		@recipe.destroy
		redirect_to root_path, notice: "Successfully deleted recipe"
	end

	def new
		@recipe = current_user.recipes.build
		@categories = Category.all.map{|c| [ c.name, c.id ]}
	end

	private

	def recipe_params
		params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy],
			directions_attributes: [:id, :step, :_destroy])

	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end
end