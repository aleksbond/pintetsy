class ListingsController < ApplicationController

  def new
  end

  def index
    pins = $pinterest.get_pins(query: 'etsy listing').data 
  end

end
