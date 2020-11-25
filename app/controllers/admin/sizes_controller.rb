class Admin::SizesController < ApplicationController

  before_action :find_size, only: %i[edit update]

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

  def edit
  end

  def update
    if @size.update(size_params)
      redirect_to admin_sizes_path
    else
      render :edit
    end
  end

  private

  def find_size
    @size = Size.find(params[:id])
    authorize [:admin, @size]
  end

  def size_params
    params.require(:size).permit(:name)
  end
end
