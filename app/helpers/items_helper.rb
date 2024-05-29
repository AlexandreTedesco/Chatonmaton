# frozen_string_literal: true

module ItemsHelper

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end
end
