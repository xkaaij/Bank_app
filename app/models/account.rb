class Account < ActiveRecord::Base
  attr_accessible :amount, :id, :user_id

  has_one :user
  has_many :transactions
end