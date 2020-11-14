class Admin::BrandsController < ApplicationController

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
    @brand = Brand.find(params[:id])
    authorize [:admin, @brand]
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :description, :photo, :video)
  end

end
