class ReviewsController < ApplicationController
  before_action :require_user_logged_in

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = 'レビューを投稿しました。'
      redirect_to root_url
    else
      @pagy, @reviews = pagy(current_user.reviews.order(id: :desc))
      flash.now[:danger] = 'レビューの投稿に失敗しました。'
      render 'toppages/index/'
    end
  end

  def destroy
    @review.destroy
    flash[:success] = 'タスクを削除しました。'
    #redirect_back(fallback_location: root_path)
    redirect_to root_path
  end
  
  private

  def review_params
    params.require(:review).permit(:title, :cosme, :content)
  end
  
  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    unless @review
      redirect_to root_url
    end
  end
end