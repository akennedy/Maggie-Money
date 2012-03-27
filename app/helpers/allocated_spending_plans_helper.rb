module AllocatedSpendingPlansHelper

  def remaining_asp_color(asp)
    asp.remaining > 0 ? "green" : (asp.remaining < 0 ? "red" : "")
  end
end