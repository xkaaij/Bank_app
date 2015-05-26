class Transaction < ActiveRecord::Base
  attr_accessible :amount, :id, :description, :sender_account_id, :receiver_account_id

  has_many :accounts
end