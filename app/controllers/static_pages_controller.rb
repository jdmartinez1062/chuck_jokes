class StaticPagesController < ApplicationController
  before_action :new_favourite_joke, only: %i[home joke]
  def home
    @joke = ChuckApi.get_random_meme
    render :home
  end

  def favourite_jokes
    @favourite_jokes = current_user.favourite_jokes.all
    render :favourite_jokes
  end

  def save_joke
    favourite_joke = current_user.favourite_jokes.create(joke_params)
    @favourite_jokes = current_user.favourite_jokes.all.paginate(page: params[:page])
    if favourite_joke.errors.empty?
      flash[:success] = 'Favourite Joke Saved!'
    else
      flash[:warning] = "Couldn't save Favourite Joke"
    end

    redirect_to :home
  end

  private

  def joke_params
    params.require(:favourite_joke).permit(:text)
  end

  def new_favourite_joke
    @favourite_joke = FavouriteJoke.new
  end
end
