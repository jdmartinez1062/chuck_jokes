class StaticPagesController < ApplicationController
  def home
    @favourite_joke = FavouriteJoke.new
    @joke = ChuckApi.get_random_meme
    @favourite_jokes = current_user.favourite_jokes.all.paginate(page: params[:page])
    render :home
  end

  def save_joke
    favourite_joke = FavouriteJoke.create(joke_params)

    if favourite_joke.errors.empty?
      flash.now[:success] = 'Event created!'
    else
      flash.now[:warning] = 'Event not created!'
    end

    render home_path
  end

  private

  def joke_params
    params.require(:favourite_joke).permit(:location, :date)
  end
end
