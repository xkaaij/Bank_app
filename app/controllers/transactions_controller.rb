class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(params[:transaction])
    
    @transaction.sender_account_id = current_user.account.id
    @transaction.save

    @account = Account.where(:id => @transaction.sender_account_id)

    @account.each do |t|
      t.amount = t.amount - @transaction.amount
      t.save
    end

    redirect_to accounts_show_url, :notice => "Het geld is overgeboekt!"
  end
end
