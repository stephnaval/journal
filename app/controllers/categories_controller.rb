class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    # Added to support both HTML and JSON responses
    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end

  def new
    @category = Category.new
    # Added to support both HTML and JSON responses
    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      # Added to support both HTML and JSON responses
      respond_to do |format|
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created }
      end
    else
      # Added to support both HTML and JSON responses
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      # Added to support both HTML and JSON responses
      respond_to do |format|
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render json: @category, status: :ok }
      end
    else
      # Added to support both HTML and JSON responses
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @category = Category.find(params[:id])
    # Added to support both HTML and JSON responses
    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end

  def edit
    @category = Category.find(params[:id])
    # Added to support both HTML and JSON responses
    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
