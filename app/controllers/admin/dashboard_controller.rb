class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @items = Item.all
    @orders = Order.all
  end
end
