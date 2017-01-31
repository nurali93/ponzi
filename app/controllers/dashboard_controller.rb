class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @deposits = current_user.deposits
  end
end
