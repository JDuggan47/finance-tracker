class Stock < ApplicationRecord
  def self.new_from_lookup(ticker_symbol)
    begin
      lookedup_stock = StockQuote::Stock.quote(ticker_symbol)
      price = strip_commas(lookedup_stock.l)
      new(name: lookedup_stock.name, ticker: lookedup_stock.symbol, last_price: price )
    rescue Exception
      return nil
    end
  end

  def self.strip_commas(number)
    number.gsub(",", "")
  end
end
