class Payable < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :payments, dependent: :destroy

  validates_presence_of :user, :offer, :amount

  after_update :generate_transaction

  def pay
    self.paid = true
    self.save
  end

  private

  def generate_transaction
    if paid
      user.credits.create(to: user.predecessor, amount: amount)
    end
  end
end
