class Admin::CartsController < AdminController

  def index
    @subbed = Cart.where(status: 'subbed').order(id: :desc)
  end

  def complete
    @cart = Cart.find(params[:id])
    @cart.status = 'completed'

    @cart.save
  end

  def completed
    @completed = Cart.where(status: 'completed').order(id: :desc)
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    redirect_to admin_carts_path
  end

end