module CashFlowPlansHelper

  def remaining_cfp_color(cfp)
    cfp.remaining > 0 ? "green" : (cfp.remaining < 0 ? "red" : "")
  end
end