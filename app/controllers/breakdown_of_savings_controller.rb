class BreakdownOfSavingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_breakdown_of_saving, :only => [:show, :clone, :edit, :update, :destroy]
  respond_to :html

  def index
    authorize! :read, BreakdownOfSaving
    @breakdown_of_savings = current_user.breakdown_of_savings
    respond_with @breakdown_of_savings
  end

  def show
    authorize! :read, @breakdown_of_saving
    respond_with @breakdown_of_saving
  end

  def new
    authorize! :create, BreakdownOfSaving
    @breakdown_of_saving = current_user.breakdown_of_savings.build
    build_breakdown_of_saving_items
    respond_with @breakdown_of_saving
  end

  def clone
    authorize! :create, @breakdown_of_saving
    @breakdown_of_saving = @breakdown_of_saving.dup :include => :breakdown_of_saving_items, :except => :date
    render :new
  end

  def create
    authorize! :create, BreakdownOfSaving
    @breakdown_of_saving = current_user.breakdown_of_savings.build(params[:breakdown_of_saving])
    if @breakdown_of_saving.save
      flash[:success] = 'Successfully created Breakdown of Savings'
      redirect_to (params[:commit] == 'Save' ? edit_breakdown_of_saving_path(@breakdown_of_saving) : dashboard_path)
    else
      flash[:error] = 'Error creating Breakdown Of Savings'
      render :action => :new
    end
  end

  def edit
    authorize! :update, @breakdown_of_saving
    respond_with @breakdown_of_saving
  end

  def update
    authorize! :update, @breakdown_of_saving
    if @breakdown_of_saving.update_attributes(params[:breakdown_of_saving])
      flash[:success] = 'Successfully updated Breakdown Of Savings'
      redirect_to (params[:commit] == 'Save' ? edit_breakdown_of_saving_path(@breakdown_of_saving) : dashboard_path)
    else
      flash[:error] = 'Error updating Breakdown Of Savings'
      render :action => :edit
    end
  end

  def destroy
    authorize! :destroy, @breakdown_of_saving
    if @breakdown_of_saving.destroy
      flash[:success] = 'Successfully deleted Breakdown Of Savings'
    else
      flash[:error] = 'Error deleting Breakdown Of Savings'
    end
    respond_with @breakdown_of_saving, :location => dashboard_path
  end

private

  def find_breakdown_of_saving
    @breakdown_of_saving = BreakdownOfSaving.find(params[:id])
  end

  def build_breakdown_of_saving_items
    BreakdownOfSavingItem::ITEMS.each do |item|
      @breakdown_of_saving.breakdown_of_saving_items.build(:name => item)
    end
  end
end
