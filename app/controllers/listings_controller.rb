class ListingsController < ApplicationController

  def index
    pins = $pinterest.get_pins(query: 'etsy listing').data 
  end

end
