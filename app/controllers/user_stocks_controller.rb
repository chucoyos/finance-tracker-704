class UserStocksController < ApplicationController

  def index
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
    end
    if current_user.can_track_stock?(stock)
      @user_stock = UserStock.create(user: current_user, stock: stock)
      flash[:notice] = "Stock #{params[:ticker]} was successfully added to your portfolio"
      redirect_to my_stocks_path
    else
      flash[:alert] = "You can't track this stock"
      redirect_to my_portfolio_path
    end
  end

  def show
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    user_stock.destroy
    flash[:notice] = "#{stock.ticker} was successfully removed from your portfolio"
    redirect_to my_stocks_path
  end

end
