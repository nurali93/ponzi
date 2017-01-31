class Offer < ApplicationRecord
  belongs_to :user
  has_many :users, dependent: :nullify
  has_one :payable, dependent: :destroy

  validates_presence_of :user, :price, :percentage

  before_create :update_price
  before_create :generate_code
  after_create :generate_payable

  PRICES = [100, 500, 1000, 5000, 10000, 50000]
  PERCENTAGES = [10, 20, 30, 40, 50, 60, 70, 80, 90]

  def code
    if payable.paid?
      super
    else
      nil
    end
  end

  private

  def payable_amount
    price/100*percentage
  end

  def update_price
    self.price = price*100
  end

  def generate_code
    self.code = SecureRandom.urlsafe_base64(32)
  end

  def generate_payable
    create_payable(amount: payable_amount, user: user)    
  end
end
