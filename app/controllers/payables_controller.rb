class PayablesController < ApplicationController
  before_action :authenticate_user!

  def show
    @payable = current_user.payables.find(params[:id])
  end
end
