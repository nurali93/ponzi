module OffersHelper
  def percentage_options
    Offer::PERCENTAGES.map { |e| ["#{e}%", e] }
  end

  def price_options
    if current_user.offer.present?
      limit = current_user.offer.price
      Offer::PRICES.select{ |e| e <= limit }.map { |e| ["RM #{e}", e] }
    else
      Offer.PRICES
    end
  end
end
