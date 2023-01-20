class FavouriteJokesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :favourite_jokes_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :favourite_joke
    end
  end
end
