class ProductsController < ApplicationController

  def index
    if session[:cart_id] == nil
      @cart = Cart.create
      session[:cart_id] = @cart.id
    else
      @cart = Cart.find(session[:cart_id])
    end

    @products = Product.paginate(page: params[:page], per_page: 10)
  end

  def a_cart
    if session[:cart_id] == nil
      @cart = Cart.create
      session[:cart_id] = @cart.id
    else
      @cart = Cart.find(session[:cart_id])
    end

    @product = Product.find(params[:id])

    @cart.add(@product, @product.price)

    redirect_to root_path
  end

  def rem1_cart
    @cart = Cart.find(session[:cart_id])

    @cart.remove(Product.find(params[:id]), 1)

    redirect_to root_path
  end

  def clear_cart
    if session[:cart_id] == nil
      @cart = Cart.create
      session[:cart_id] = @cart.id
    else
      @cart = Cart.find(session[:cart_id])
      @cart.clear
    end

    redirect_to root_path
  end
end
