class WishlistsController < ApplicationController
  def index
    render json: Wishlist.all
  end

  def show
    render json: Wishlist.find(params[:id])
  end

  def create
    wishlist = Wishlist.new(wishlist_params)

    if wishlist.save
      redirect_to wishlist
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:user_id, :name)
  end
end
