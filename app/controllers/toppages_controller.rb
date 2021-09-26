class ToppagesController < ApplicationController
  def index
    if logged_in?
      @review = current_user.reviews.build
      @pagy, @reviews = pagy(current_user.feed_reviews.order(id: :desc))
    end
  end
end