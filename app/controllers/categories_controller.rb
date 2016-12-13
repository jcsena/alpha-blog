class CategoriesController < ApplicationController

  before_action :set_category , only: [:edit, :update, :show, :destroy]

  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You create the new category"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(:id)
  end

end