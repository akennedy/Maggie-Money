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
    respond_to do |format|
      format.html
      format.xls { doc_raptor_send }
      format.pdf { doc_raptor_send }
    end
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
    else
      flash[:error] = 'Error creating Cash Flow Plan'
    end
    respond_with @cash_flow_plan, :location => dashboard_path
  end

  def edit
    authorize! :update, @cash_flow_plan
    respond_with @cash_flow_plan
  end

  def update
    authorize! :update, @cash_flow_plan
    if @cash_flow_plan.update_attributes(params[:cash_flow_plan])
      flash[:success] = 'Successfully updated Cash Flow Plan'
    else
      flash[:notice] = 'Error updating Cash Flow Plan'
    end
    respond_with @cash_flow_plan, :location => dashboard_path
  end

  def destroy
    authorize! :destroy, @cash_flow_plan
    if @cash_flow_plan.destroy
      flash[:success] = 'Successfully deleted Cash Flow Plan'
    else
      flash[:notice] = 'Error deleting Cash Flow Plan'
    end
    respond_with @cash_flow_plan, :location => dashboard_path
  end

private

  def find_cash_flow_plan
    @cash_flow_plan = CashFlowPlan.find(params[:id])
  end

  def build_cash_flow_plan_items
    CashFlowPlanItem::ITEMS.each do |ti|
      @cash_flow_plan.cash_flow_plan_items.build(:name => ti[:name], :category => ti[:category])
    end
  end
  
  def doc_raptor_send(options = { })
    default_options = {
      :name             => controller_name,
      :document_type    => request.format.to_sym,
      :test             => ! Rails.env.production?,
    }
    options = default_options.merge(options)
    options[:document_content] ||= render_to_string
    ext = options[:document_type].to_sym

    response = DocRaptor.create(options)
    if response.code == 200
      send_data response, :filename => "#{options[:name]}.#{ext}", :type => ext
    else
      render :inline => response.body, :status => response.code
    end
  end
end
