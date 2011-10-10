class BudgetsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_budget, :only => [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    authorize! :read, Budget
    @budgets = current_user.budgets
  end

  def show
    authorize! :read, @budget
  end

  def new
    @budget = current_user.budgets.build
    build_budget_items
  end

  def create
    @budget = current_user.budgets.build(params[:budget])
    if @budget.save
      flash[:success] = 'Successfully created Budget'
    else
      flash[:error] = 'Error creating Budget'
    end
    respond_with @budget, :location => budgets_path
  end

  def edit
    authorize! :update, @budget
  end

  def update
    authorize! :update, @budget
    if @budget.update_attributes(params[:budget])
      flash[:success] = 'Successfully updated Budget'
    else
      flash[:notice] = 'Error updating Budget'
    end
    respond_with @budget, :location => budgets_path
  end

  def destroy
    authorize! :destroy, @budget
    if @budget.destroy
      flash[:success] = 'Successfully deleted Budget'
    else
      flash[:notice] = 'Error deleting Budget'
    end
    respond_with @budget, :location => budgets_path
  end

private

  def find_budget
    @budget = Budget.find(params[:id])
  end

  def build_budget_items
    BudgetItem::ITEMS.each do |ti|
      @budget.budget_items.build(:name => ti[:name], :category => ti[:category], :amount => '0.00', :actual => '0.00')
    end
  end
end
