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

  def fill
    @cart = Cart.find(session[:cart_id])
  end

  def subb
    @cart = Cart.find(session[:cart_id])
    @cart.update(cart_params)
    flash[:success] = 'Wait for us to call you.'

    @cart = Cart.create
    session[:cart_id] = @cart.id

    redirect_to root_path
  end

  private

  def cart_params
    params.require(:cart).permit(:name,:phone)
  end
end
