class FoodItemsController < ApplicationController
  before_action :authorize_request

  # GET /food_items
  def index
    @food_items = @current_user.food_items.order('name ASC')
    render json: @food_items, status: :ok
  end

  # POST /food_items
  def create
    @food_item = @current_user.food_items.new(food_item_params)
    if @food_item.save
      render json: @food_item, status: :created
    else
      render json: { errors: @food_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /food_items/:id
  def destroy
    @food_item = @current_user.food_items.find(params[:id])
    if @food_item.destroy
      head :no_content, status: :ok
    else
      render json: @food_item.errors, status: :unprocessable_entity
    end
  end

  # PUT /food_items/:id
  def update
    @food_item = @current_user.food_items.find(params[:id])
    @food_item.quantity = params[:quantity]
    if @food_item.save
      render json: {quantity: @food_item.quantity}
    end
  end

  private

  def food_item_params
    params.permit(:name, :quantity)
  end
end
