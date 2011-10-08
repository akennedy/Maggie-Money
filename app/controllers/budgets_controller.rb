class BudgetsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def new
    @budget = current_user.budgets.build
    build_transactions
  end

  def create
    @budget = current_user.budgets.build(params[:budget])
    if @budget.save
      flash[:notice] = 'Successfully created Budget'
    else
      flash[:error] = 'Error creating Budget'
    end
    respond_with @budget
  end

  def edit
    @budget = Budget.find(params[:id])
  end

private

  def build_transactions
    Transaction::ITEMS.each do |ti|
      @budget.transactions.build(:name => ti[:name], :category => ti[:category])
    end
  end
end
