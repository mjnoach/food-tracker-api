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

  # GET /recipes/:id
  def show
    @recipe = @current_user.recipes.find(params[:id])
    render json: @recipe, status: :ok
  end

  # DELETE /recipes/:id
  def destroy
    @recipe = @current_user.recipes.find(params[:id])
    if @recipe.destroy
      head :no_content, status: :ok
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.permit(:name, :description)
  end
end
