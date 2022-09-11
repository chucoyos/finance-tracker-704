class StocksController < ApplicationController
  def my_portfolio
  end

  def search_stock
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      render 'stocks/my_portfolio'
    else
      render 'stocks/my_portfolio'
    end
  end
end