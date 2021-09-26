class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    review = Review.find(params[:review_id])
    current_user.favorite(review)
    flash[:success] = 'ツイートをお気に入りしました。'
    redirect_to root_url
  end

  def destroy
    review = Review.find(params[:review_id])
    current_user.unfavorite(review)
    flash[:success] = 'ツイートのお気に入りを解除しました。'
    redirect_to root_url
  end
end