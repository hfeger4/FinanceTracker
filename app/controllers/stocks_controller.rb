class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        render "users/result"
      else
        flash[:danger] = "You have entered an incorrect symbol"
        render "users/my_portfolio"
      end
    else
      flash[:danger] = "You have entered an empty search string."
      render "users/my_portfolio"
    end
  end
end
