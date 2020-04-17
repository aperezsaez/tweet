class LikesController < ApplicationController
    before_action :authenticate_user!

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @like = Like.create(tweet: @tweet, user: current_user, like: true)

    if @like.save
      redirect_to root_path, notice: 'Has dado Like'
    else
      redirect_to root_path, alert: 'No se pudo dar like'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @likee = like.find_by(tweet: @tweet, user: current_user, completed: true)

    if like.exists?(user_id: current_user.id, tweet_id: @tweet.id , completed: true)
      @likee.destroy
      redirect_to root_path, alert: 'Ya no te gusta'
    else
      redirect_to root_path, alert: 'Igual te gusta'
    end
  end
end
