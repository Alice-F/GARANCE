class Admin::BrandsController < ApplicationController

  before_action :find_brand, only: %i[show edit update]

  def index
    @brands = policy_scope([:admin, Brand])
  end

  def new
    @brand = Brand.new
    authorize [:admin, @brand]
  end

  def create
    @brand = Brand.new(brand_params)
    authorize [:admin, @brand]
    if @brand.save
      redirect_to admin_brand_path(@brand)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @brand.update(brand_params)
      redirect_to admin_brand_path(@brand)
    else
      render :edit
    end
  end

  private

  def find_brand
    @brand = Brand.find(params[:id])
    authorize [:admin, @brand]
  end

  def brand_params
    params.require(:brand).permit(:name, :description, :photo)
  end

end
