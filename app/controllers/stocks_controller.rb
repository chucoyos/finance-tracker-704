class StocksController < ApplicationController
  def my_portfolio
  end

  def search_stock
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
      render 'stocks/my_portfolio'
      else
        flash[:alert] = "Please enter a valid symbol to search"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end
  end
end