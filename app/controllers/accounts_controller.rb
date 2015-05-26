class AccountsController < ApplicationController
  def new
  end

  def show
    @account = Account.where(:user_id => current_user.id)
  end
end
