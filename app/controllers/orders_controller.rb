class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @orders= Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    byebug
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update (order_params)
      redirect_to @order
    else
      render :edit
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to orders_path
  end

private

  def order_params
    params.require(:order).permit(:board, :user_id)
  end
end
