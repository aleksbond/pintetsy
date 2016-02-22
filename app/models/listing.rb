class Listing
  attr_accessor :pin, :etsy_listing

  def initialize(pin)
    @pin = pin
    @etsy_listing = Etsy::Listing.find(etsy_id(@pin.note))
  end

  def num_favorers
    @etsy_listing.num_favorers
  end

  def price
    @etsy_listing.price
  end

  def shop
    @shop ||= Etsy::User.find(@etsy_listing.user_id).result
  end

  def feedback
    @feedback ||= @shop["feedback_info"] #{"count"=>120, "score"=>100}
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

  private

  def etsy_id(note)
    note.scan(/\d{9}/).first.to_i
  end
end
