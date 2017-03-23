class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
      @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
      @tweet = Tweet.new(tweet_params)
      
      if @tweet.save 
          redirect_to @tweet, notice: "tweet was successfuly create"
        else
        render :new
      end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

def update
  @tweet = Tweet.find(params[:id])
  @tweet.update(tweet_params)
  if @tweet.save
    redirect_to @tweet, notice: "tweet update"
  else
    render :edit, notice: "tweet could not be update"
  end
end


def destroy
  @tweet = Tweet.find(params[:id])
  @tweet.destroy
  redirect_to root_path
end


private
  def tweet_params
    params.require(:tweet).permit(:name, :message)
  end


end

