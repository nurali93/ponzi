class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :payable

  validates_presence_of :user, :payable

  enum status: [:initialized, :pending, :unpaid, :paid, :cancelled]
end
