class Listing
  attr_accessor :pin, :etsy_listing, :shop

  def initialize(pin)
    @pin = pin
    @etsy_listing = Etsy::Listing.find(etsy_id(@pin.note))
    raise ArgumentError.new("Etsy listing must have user_id") if @etsy_listing.user_id.nil?
    @shop = Etsy::User.find(@etsy_listing.user_id).result
  end

  def num_favorers
    @etsy_listing.num_favorers
  end

  def price
    return "N/A" if @etsy_listing.price.nil?
    @etsy_listing.price
  end

  def feedback
    @shop["feedback_info"] #{"count"=>120, "score"=>100}
  end

  def shop_owner
    @shop["login_name"]
  end

  def item_image
    @item_image ||= @etsy_listing.image.result["url_570xN"]
  end

  def title
    @etsy_listing.title
  end

  def url
    @etsy_listing.url
  end

  private

  def etsy_id(note)
    note.scan(/\d{9}/).first.to_i
  end
end
