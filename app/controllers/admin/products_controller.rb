class Admin::ProductsController < ApplicationController
  before_action :find_brands, only: %i[new create edit update]
  before_action :find_categories, only: %i[new create edit update]
  before_action :find_product, only: %i[edit update]

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

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
    authorize [:admin, @product]
  end

  def find_brands
    @brands = policy_scope([:admin, Brand])
  end

  def find_categories
    @categories = policy_scope([:admin, Category])
  end

  def product_params
    params.require(:product).permit(:name, :description, :composition, :brand_id, :category_id, :main_photo, complementary_photos: [])
  end

end
