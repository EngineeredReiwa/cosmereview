class ToppagesController < ApplicationController
  def index
    if logged_in?
      @pagy, @reviews = pagy(current_user.reviews.order(id: :desc))
    end
  end
end