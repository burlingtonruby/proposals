class PagesController < ApplicationController
  include UserHelper

  def welcome
    redirect_to proposals_path if current_user
  end
end
