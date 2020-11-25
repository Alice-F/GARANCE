class Admin::CategoriesController < ApplicationController

  before_action :find_category, only: %i[edit update]

  def index
    @categories = policy_scope([:admin, Category])
  end

  def new
    @category = Category.new
    authorize [:admin, @category]
  end

  def create
    @category = Category.new(category_params)
    authorize [:admin, @category]
    if @category.save
      redirect_to admin_categories_path
      # flash[:notice] = "La nouvelle catégorie #{@category.name.downcase} est créée"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  private

  def find_category
    @category = Category.find(params[:id])
    authorize [:admin, @category]
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
