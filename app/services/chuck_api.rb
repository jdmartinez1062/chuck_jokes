class ChuckApi
  @url = 'https://api.chucknorris.io/jokes/random'

  def self.get_random_meme
    response = RestClient.get(@url)
    JSON.parse(response, object_class: OpenStruct)
  end
end
