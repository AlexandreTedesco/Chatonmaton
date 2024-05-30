# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.all
    authorize Item
  end

  def new
    @item = Item.new
    authorize @item # Utilisez @item au lieu de @Item
  end

  def create
    @item = Item.new(item_params)
    authorize @item
    if @item.save
      redirect_to @item
      flash[:success] = "L'article a été créé avec succès."
    else
      redirect_to new_item_path
      flash[:error] = "Une erreur a été détectée : #{@item.errors.full_messages.join(",")}"
    end
  end

  def update
    authorize @item
    if @item.update(item_params)
      redirect_to @item
      flash[:success] = "L'article a été modifié avec succès."
    else
      redirect_to :edit
      flash[:error] = "Une erreur a été détectée : #{@item.errors.full_messages.join(",")}"
    end
  end

  def destroy
    authorize @item
    @item.destroy
    redirect_to items_url
    flash[:success] = "L'article a été supprimé avec succès."
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price)
  end
end
