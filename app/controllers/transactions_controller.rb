class TransactionsController < ApplicationController
  def new
  end

  def create
    @transaction = Transaction.new(params[:transaction])
  end
end
