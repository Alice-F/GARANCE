class Admin::StocksController < ApplicationController
  before_action :find_sizes, only: %i[new create edit update]
  before_action :find_products, only: %i[new create edit update]
  before_action :find_stock, only: %i[edit update]

  def index
    @stocks = policy_scope([:admin, Stock])
  end

  def new
    @stock = Stock.new
    authorize [:admin, @stock]
  end

  def create
    @stock = Stock.new(stock_params)
    authorize [:admin, @stock]
    if @stock.save
      redirect_to admin_stocks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @stock.update(stock_params_edit)
      redirect_to admin_stocks_path
    else
      render :edit
    end
  end

  private

  def find_stock
    @stock = Stock.find(params[:id])
    authorize [:admin, @stock]
  end

  def find_sizes
    @sizes = policy_scope([:admin, Size])
  end

  def find_products
    @products = policy_scope([:admin, Product]).includes(:brand).order('brands.name ASC')
  end

  def stock_params
    params.require(:stock).permit(:quantity, :product_id, :size_id)
  end

  def stock_params_edit
    params.require(:stock).permit(:quantity)
  end
end
