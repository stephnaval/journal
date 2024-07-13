class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end

  def new
    @category = Category.new
    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      respond_to do |format|
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render json: @category, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end

  def edit
    @category = Category.find(params[:id])
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
