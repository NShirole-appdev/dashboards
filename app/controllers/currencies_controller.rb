class CurrenciesController < ApplicationController
  def first_currency

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    render("currency_templates/step_one.html.erb")
  end 

  def second_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys

    @from_symbol = params.fetch("from_currency")
    render("currency_templates/step_two.html.erb")
  end 

  def convert_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    @from_symbol = params.fetch("from_currency")
    @convert_symbol = params.fetch("convert_currency")
    @conversion_data = open("https://api.exchangerate.host/convert?from=#{@from_symbol}&to=#{@convert_symbol}").read
    @parsed_conversion_data = JSON.parse(@conversion_data)
    @result = @parsed_conversion_data.fetch("result")
    render("currency_templates/step_three.html.erb")
  end 

end