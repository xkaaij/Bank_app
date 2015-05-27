class AccountsController < ApplicationController
  def new
  end

  def show
    @account = Account.where(:user_id => current_user.id)

    #@transaction = Transaction.where("receiver_account_id = '#{current_user.account.id}' or sender_account_id = '#{current_user.account.id}'")
    @transaction = Transaction.where("receiver_account_id  = ? or sender_account_id = ?", current_user.account.id, current_user.account.id)
  end
end
