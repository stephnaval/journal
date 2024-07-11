class CategoriesController < ApplicationController
  def create
    category = Category.new(category_params)
    if category.save
      render json: category, status: :created
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      render json: category, status: :ok
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  def edit
    category = Category.find(params[:id])
    render json: category, status: :ok
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end