class MealsController < ApplicationController
  before_action :authorize_request

  # GET /recipes
  def index
    @meals = @current_user.meals.order('day ASC')
    render json: @meals, status: :ok
  end

  # POST /meals
  def create
    @meal = @current_user.meals.new(meal_params)
    @meal.recipe = Recipe.find(params[:recipe])
    if @meal.save
      render json: @meal, status: :created
    else
      render json: @meal.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def meal_params
    params.permit(:day)
  end
end
