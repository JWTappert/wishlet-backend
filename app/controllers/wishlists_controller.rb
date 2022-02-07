class WishlistsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

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

  def update
    wishlist = Wishlist.find(params[:id])
    wishlist.update(wishlist_params)
  end

  def destroy
    wishlist = Wishlist.find(params[:id])
    if wishlist.present?
      wishlist.destroy
    else
      record_not_found
    end
  end

  private

  def wishlist_params
    params.require(:input).permit(:user_id, :name)
  end

  def record_not_found
    render plain: "404 not found", status: 404
  end
end
