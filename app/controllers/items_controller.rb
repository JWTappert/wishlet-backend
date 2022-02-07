class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    wishlist = Wishlist.find(params[:wishlist_id])
    render json: Item.where(wishlist_id: wishlist.id)
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    wishlist = Wishlist.find(params[:wishlist_id])
    item = wishlist.items.create(wishlist_item_params)
    render json: item
  end

  def update
    item = Item.find(params[:id])
    item.update(wishlist_item_params)
  end

  def destroy
    item = Item.find(params[:id])
    if item.present?
      item.destroy
    else
      render plain: "404 not found", status: 404
    end
  end

  private

  def wishlist_item_params
    params.require(:input).permit(:name, :description, :link, :photo)
  end
end
