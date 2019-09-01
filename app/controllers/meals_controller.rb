class MealsController < ApplicationController
  before_action :authorize_request

  # GET /meals
  def index
    @meals = @current_user.meals
    @meals = @meals.map { |meal| MealSerializer.new(meal).as_json }.group_by { |meal| meal[:day] }
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

  # DELETE /meals/:id
  def destroy
    @meal = @current_user.meals.find(params[:id])
    if @meal.destroy
      head :no_content, status: :ok
    else
      render json: @meal.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def meal_params
    params.permit(:day)
  end
end
