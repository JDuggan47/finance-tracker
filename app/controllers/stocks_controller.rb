class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "You Have Entered an Empty Search!"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You Have Entered an Incorrect Symbol!" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end

end
