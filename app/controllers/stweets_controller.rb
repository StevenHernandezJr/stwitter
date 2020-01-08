class StweetsController < ApplicationController
  before_action :find_stweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @stweets = Stweet.all.order("created_at DESC")
  end

  def show
  end

  def new
    @stweet = current_user.stweets.build
  end

  def create
    @stweet = current_user.stweets.build(stweet_params)

    if @stweet.save then
      redirect_to @stweet
    else
      redirect_to "new"
    end
  end

  def edit
  end

  def update
    if @stweet.update(stweet_params) then
      flash[:notice] = "You have successfully updated your Stweet!"
      redirect_to root_path
    else
      redirect_to "edit"
    end
  end

  def destroy
    @stweet.destroy
    redirect_to root_path
  end

  private

  def stweet_params
    params.require(:stweet).permit(:stweet)
  end

  def find_stweet
    @stweet = Stweet.find(params[:id])
  end
end
