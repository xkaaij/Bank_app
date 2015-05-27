class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @transaction = Transaction.new(params[:transaction])
        
        @transaction.sender_account_id = current_user.account.id
        
        @account = Account.find (@transaction.sender_account_id)

        @transaction.save!

        @account.amount = @account.amount - @transaction.amount
        @account.save!

        @account = Account.find (@transaction.receiver_account_id)

        @account.amount = @account.amount + @transaction.amount
        @account.save!

        redirect_to accounts_show_url, :notice => "Het geld is overgeboekt!"
    end
    rescue ActiveRecord::RecordInvalid => e
      redirect_to accounts_show_url, :notice => "Er is iets misgegaan bij de transactie!"
    end

  end
end
