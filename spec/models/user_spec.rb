require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:unsaved_valid_user) { User.new(email: 'test@test.com', password: '123456') }
  context 'user with valid attributes' do
    it 'saves to the database' do
      user = unsaved_valid_user
      user.save
      expect(User.first).to eql(user)
    end

    it 'creates an association with favourite_jokes' do
      user = unsaved_valid_user
      user.save
      joke = user.favourite_jokes.new(joke_url: 'test.com')
      joke.save
      expect(FavouriteJoke.first).to eql(joke)
    end
  end

  context 'user with unvalid attributes' do
    it 'invalid email' do
      user = unsaved_valid_user
      user.email = 'test'
      user.save

      expect(User.first).to_not eql(user)
      expect(user.errors.count).to eql(1)
    end

    it 'invalid password' do
      user = unsaved_valid_user
      user.password = 1324
      user.save

      expect(User.first).to_not eql(user)
      expect(user.errors.count).to eql(1)
    end
  end
end
