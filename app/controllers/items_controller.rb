class ItemsController < ApplicationController
  def index
    @items = Item.all 
  end
  
  def show
    @item = Item.find(params[:id])
  end

  def new
    @item =Item.new
  end

  def create
    @item = Item.new(post_params)
    @item.save
    redirect_to "/items/#{@item.id}"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(post_params)
    redirect_to "/items/#{@item.id}"
  end

  private

  def post_params
    # params.require(:key).permit(:filter)
    params.require(:item).permit(
      :name,
      :description,
      :price,
      :seller_id,
      :email,
      :image_url
    )
  end
end
