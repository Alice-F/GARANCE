class Admin::CategoriesController < ApplicationController

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

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
