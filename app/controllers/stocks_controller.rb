class StocksController < ApplicationController

  def search_stock
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:alert] = "Please enter a valid symbol to search"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end
  end

  def create
    @stock = Stock(params[:ticker])
    if @stock.save
      current_user.stocks << @stock
      flash[:notice] = "#{@stock.name} was successfully added to your portfolio"
      redirect_to my_stocks_path
    else
      flash[:alert] = "Something went wrong with the stock search process"
      redirect_to my_stocks_path
    end
  end
end