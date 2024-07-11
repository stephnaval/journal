class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def new
    @category = Category.new
    render json: @category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      render json: @category, status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def show
    @category = Category.find(params[:id])
    render json: @category, status: :ok
  end

  def edit
    @category = Category.find(params[:id])
    render json: @category, status: :ok
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end