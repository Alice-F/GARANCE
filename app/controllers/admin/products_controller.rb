class Admin::ProductsController < ApplicationController
  before_action :brands, only: %i[new create]
  before_action :categories, only: %i[new create]

  def index
    @products = policy_scope([:admin, Product])
  end

  def new
    @product = Product.new
    authorize [:admin, @product]
  end

  def create
    @product = Product.new(product_params)
    authorize [:admin, @product]
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :composition, :brand_id, :category_id, :main_photo, complementary_photos: [])
  end

  def brands
    @brands = policy_scope([:admin, Brand])
  end

  def categories
    @categories = policy_scope([:admin, Category])
  end
end
