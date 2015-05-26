class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      @account = Account.new
      @account.amount = 100
      @account.user_id = @user.id
      @account.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

end
