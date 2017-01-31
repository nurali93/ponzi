class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payable

  def create
    @payment = @payable.payments.new(user: current_user)
    respond_to do |format|
      if @payment.save && @payable.pay
        format.html { redirect_to @payable.offer }
      else
        format.html { render json: @payment.errors }
      end
    end
  end

  private

  def set_payable
    @payable = current_user.payables.find(params[:payable_id])
  end
end
