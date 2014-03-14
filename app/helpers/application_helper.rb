module ApplicationHelper
  CutoffDate = Rails.configuration.cutoff_date.in_time_zone("Eastern Time (US & Canada)").strftime('%B %e, %Y at %I:%M%P Eastern')
end
