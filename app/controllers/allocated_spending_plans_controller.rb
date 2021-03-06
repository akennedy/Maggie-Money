class AllocatedSpendingPlansController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_allocated_spending_plan, :only => [:show, :clone, :edit, :update, :destroy]
  respond_to :html

  def index
    authorize! :read, AllocatedSpendingPlan
    @allocated_spending_plans = current_user.allocated_spending_plans
    respond_with @allocated_spending_plans
  end

  def show
    authorize! :read, @allocated_spending_plan
    respond_with @allocated_spending_plan
  end

  def new
    authorize! :create, AllocatedSpendingPlan
    @allocated_spending_plan = current_user.allocated_spending_plans.build
    @allocated_spending_plan.cash_flow_plan = CashFlowPlan.find(params[:cfp_id]) if params[:cfp_id]
    build_allocated_spending_plan_items
    respond_with @allocated_spending_plan
  end

  def clone
    authorize! :create, @allocated_spending_plan
    @allocated_spending_plan = @allocated_spending_plan.dup :include => :allocated_spending_plan_items, :except => [:date, :week_1_date, :week_2_date, :week_3_date, :week_4_date]
    render :new
  end

  def create
    authorize! :create, AllocatedSpendingPlan
    @allocated_spending_plan = current_user.allocated_spending_plans.build(params[:allocated_spending_plan])
    if @allocated_spending_plan.save
      flash[:success] = 'Successfully created Allocated Spending Plan'
      redirect_to (params[:commit] == 'Save' ? edit_allocated_spending_plan_path(@allocated_spending_plan) : dashboard_path)
    else
      flash[:error] = 'Error creating Allocated Spending Plan'
      render :action => :new
    end
  end

  def edit
    authorize! :update, @allocated_spending_plan
    respond_with @allocated_spending_plan
  end

  def update
    authorize! :update, @allocated_spending_plan
    if @allocated_spending_plan.update_attributes(params[:allocated_spending_plan])
      flash[:success] = 'Successfully updated Allocated Spending Plan'
      redirect_to (params[:commit] == 'Save' ? edit_allocated_spending_plan_path(@allocated_spending_plan) : dashboard_path)
    else
      flash[:error] = 'Error updating Allocated Spending Plan'
      render :action => :edit
    end
  end

  def destroy
    authorize! :destroy, @allocated_spending_plan
    if @allocated_spending_plan.destroy
      flash[:success] = 'Successfully deleted Allocated Spending Plan'
    else
      flash[:error] = 'Error deleting Allocated Spending Plan'
    end
    respond_with @allocated_spending_plan, :location => dashboard_path
  end

private

  def find_allocated_spending_plan
    @allocated_spending_plan = AllocatedSpendingPlan.find(params[:id])
  end

  def build_allocated_spending_plan_items
    AllocatedSpendingPlanItem::CATEGORIES.each do |category|
      category[:items].each do |item|
        @allocated_spending_plan.allocated_spending_plan_items.build(:name => item, :category => category[:name])
      end if category[:items]
    end
  end
end
