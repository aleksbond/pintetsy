class ListingsController < ApplicationController

  def index
    pins = $pinterest.get_pins(query: 'etsy listing').data 
    @listings = []
    pins.each do |pin|
      begin
        @listings << Listing.new(pin)
      rescue
        next
      end
    end
  end

end
