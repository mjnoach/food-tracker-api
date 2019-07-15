class RecipesController < ApplicationController
  before_action :authorize_request

  # GET /recipes
  def index
    @recipes = @current_user.recipes.order('name ASC')
    render json: @recipes, status: :ok
  end

  # POST /recipes
  def create
    @recipe = @current_user.recipes.new(recipe_params)
    if @recipe.save
      render json: @recipe, status: :created
    else
      render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/:id
  def destroy
    @recipes = @current_user.recipes.find(params[:id])
    if @recipes.destroy
      head :no_content, status: :ok
    else
      render json: @recipes.errors, status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.permit(:name, :description)
  end
end
