module BreakdownOfSavingsHelper

  def remaining_bos_color(bos)
    bos.remaining > 0 ? "green" : (bos.remaining < 0 ? "red" : "")
  end
end