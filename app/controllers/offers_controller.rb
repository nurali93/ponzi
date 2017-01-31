class OffersController < ApplicationController
  before_action :authenticate_user!, except: [:recruit]

  def index
    @offers = current_user.offers
  end

  def recruit
    @offer = Offer.find_by(code: params[:code])
    session[:offer_code] = @offer.code
    redirect_to new_user_registration_path
  end

  def new
    @offer = current_user.offers.new
  end

  def create
    @offer = current_user.offers.new(offer_params)
    respond_to do |format|
      if @offer.save
        format.html { redirect_to offers_path }
      else
        format.html { redirect_to new_offer_path }
      end
    end
  end

  private 

  def set_offer
    @offer = current_user.offers.find params[:id] 
  end

  def offer_params
    params.require(:offer).permit(:price, :percentage)
  end
end
