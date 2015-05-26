class Transaction < ActiveRecord::Base
  attr_accessible :amount, :id, :description, :sender_account_id, :receiver_account_id

  has_many :accounts

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
end