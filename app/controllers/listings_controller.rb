class ListingsController < ApplicationController

  def index
    pins = $pinterest.get_pins(query: 'etsy listing').data 
    @listings = []
    pins.each { |pin| @listings << Listing.new(pin) }
  end

end
