class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include UserHelper

  helper_method :current_round, :past_cutoff_date?

  def current_round
    Rails.configuration.current_round
  end

  def past_cutoff_date?
    DateTime.now > Proposals::Application.config.cutoff_date
  end
end
