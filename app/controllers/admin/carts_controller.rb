class Admin::CartsController < AdminController

  def index
    @subbed = Cart.where(status: 'subbed').order(id: :desc)
  end

  def processing
    @processing = Cart.where(status: 'processing').order(id: :desc)
  end

  def completed
    @completed = Cart.where(status: 'completed').order(id: :desc)
  end

  def declined
    @declined = Cart.where(status: 'declined').order(id: :desc)
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    redirect_to admin_carts_path
  end

end