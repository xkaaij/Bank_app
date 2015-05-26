class Account < ActiveRecord::Base
  attr_accessible :amount, :id, :user_id

  has_one :user
  has_many :transactions

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
end