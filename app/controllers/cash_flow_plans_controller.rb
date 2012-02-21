class CashFlowPlansController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_cash_flow_plan, :only => [:show, :clone, :edit, :update, :destroy]
  respond_to :html

  def index
    authorize! :read, CashFlowPlan
    @cash_flow_plans = current_user.cash_flow_plans
    respond_with @cash_flow_plans
  end

  def show
    authorize! :read, @cash_flow_plan
    respond_with @cash_flow_plan
  end

  def new
    authorize! :create, CashFlowPlan
    @cash_flow_plan = current_user.cash_flow_plans.build
    build_cash_flow_plan_items
    respond_with @cash_flow_plan
  end

  def clone
    authorize! :create, @cash_flow_plan
    @cash_flow_plan = @cash_flow_plan.dup :include => :cash_flow_plan_items, :except => :date
    render :new
  end

  def create
    authorize! :create, CashFlowPlan
    @cash_flow_plan = current_user.cash_flow_plans.build(params[:cash_flow_plan])
    if @cash_flow_plan.save
      flash[:success] = 'Successfully created Cash Flow Plan'
      redirect_to (params[:commit] == 'Save' ? edit_cash_flow_plan_path(@cash_flow_plan) : dashboard_path)
    else
      flash[:error] = 'Error creating Cash Flow Plan'
      render :action => :new
    end
  end

  def edit
    authorize! :update, @cash_flow_plan
    respond_with @cash_flow_plan
  end

  def update
    authorize! :update, @cash_flow_plan
    if @cash_flow_plan.update_attributes(params[:cash_flow_plan])
      flash[:success] = 'Successfully updated Cash Flow Plan'
      redirect_to (params[:commit] == 'Save' ? edit_cash_flow_plan_path(@cash_flow_plan) : dashboard_path)
    else
      flash[:error] = 'Error updating Cash Flow Plan'
      render :action => :edit
    end
  end

  def destroy
    authorize! :destroy, @cash_flow_plan
    if @cash_flow_plan.destroy
      flash[:success] = 'Successfully deleted Cash Flow Plan'
    else
      flash[:error] = 'Error deleting Cash Flow Plan'
    end
    respond_with @cash_flow_plan, :location => dashboard_path
  end

private

  def find_cash_flow_plan
    @cash_flow_plan = CashFlowPlan.find(params[:id])
  end

  def build_cash_flow_plan_items
    CashFlowPlanItem::CATEGORIES.each do |category|
      category[:items].each do |item|
        @cash_flow_plan.cash_flow_plan_items.build(:name => item, :category => category[:name])
      end if category[:items]
    end
  end
end
