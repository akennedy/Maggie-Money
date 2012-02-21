module ApplicationHelper

  def alert_leader(key=nil)
    case key
      when :success then "Well done!"
      when :notice then "Well done!"
      when :error then "Oh snap!"
      when :alert then "Oh snap!"
      when :info then "Heads up!"
      else ""
    end
  end

  def alert_class(key=nil)
    case key
      when :success then "alert-success"
      when :notice then "alert-success"
      when :error then "alert-error"
      when :alert then "alert-error"
      when :info then "alert-info"
      else ""
    end
  end
end
