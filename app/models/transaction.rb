class Transaction < ApplicationRecord
  belongs_to :from, polymorphic: true
  belongs_to :to, polymorphic: true

  validates_presence_of :from, :to, :amount
  before_create :calculate_portion
  after_create :pay_predecessor

  private

  def portion
    [amount/100*(from.offer.percentage), amount/100*(100-from.offer.percentage)]
  end

  def calculate_portion
    self.amount = portion.first
  end

  def pay_predecessor
    if to.present? && portion.first > 100
      to.credits.create(to: to.predecessor, amount: portion.last)
    end
  end
end
