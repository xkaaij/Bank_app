class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    ActiveRecord::Base.transaction do
      begin
        @transaction = Transaction.new(params[:transaction])
        
        @transaction.sender_account_id = current_user.account.id
        

        @account = Account.where(:id => @transaction.sender_account_id).first

        @account.amount = @account.amount - @transaction.amount
        @account.save!

        @account = Account.where(:id => @transaction.receiver_account_id).first

        @account.amount = @account.amount - @transaction.amount
        @account.save!

        @transaction.save!

        redirect_to accounts_show_url, :notice => "Het geld is overgeboekt!"

      rescue ActiveRecord::RecordInvalid => e
        redirect_to accounts_show_url, :notice => "U staat in het rood!"
      end
    end

  end
end
