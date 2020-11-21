class Admin::SizesController < ApplicationController
  def index
    @sizes = policy_scope([:admin, Size])
  end

  def new
    @size = Size.new
    authorize [:admin, @size]
  end

  def create
    @size = Size.new(size_params)
    authorize [:admin, @size]
    if @size.save
      redirect_to admin_sizes_path
    else
      render :new
    end
  end

  private

  def size_params
    params.require(:size).permit(:name)
  end
end
