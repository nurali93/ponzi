class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :offers, dependent: :nullify
  has_many :payables, dependent: :nullify
  has_many :payments, dependent: :nullify
  has_many :deposits, class_name: 'Transaction', as: 'to'
  has_many :credits, class_name: 'Transaction', as: 'from'

  def offer
    if offer_id
      Offer.find(offer_id)
    end
  end

  def predecessor
    offer.user if offer
  end

  def name
    email.split('@').first.humanize
  end

  def hash
    Digest::MD5.hexdigest("#{id}_#{email}")
  end
end
