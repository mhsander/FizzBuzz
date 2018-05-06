require 'fizzbuzz'

module NumbersHelper
  # Giphy API, get keyword input from fizzbuzz and pass it to search for gif.
  def get_fizz(q)

    api_instance = GiphyClient::DefaultApi.new

    api_key = "p9ZBCTuQsD9M1EoxaDoyeb7zS6oaX5JA"

    opts = {
        limit: 30, # Integer | The maximum number of records to return.
        offset: 0, # Integer | An optional results offset. Defaults to 0.
        rating: "g", # String | Filters results by specified rating.
        lang: "en", # String | Specify default country for regional content; use a 2-letter ISO 639-1 country code.
        fmt: "json" # String | Used to indicate the expected response format. Default is Json.
    }

    # translates 'Fizz Buzz' to Giphy API search model
    if q == 'Fizz Buzz'
      q = 'Fizz+Buzz'
    end

    begin
      #Search Endpoint
      giphy = api_instance.gifs_search_get(api_key, q, opts)
      giphy = giphy.data[rand(30)].images.original.url # returns random giphy from APIT library

    rescue GiphyClient::ApiError => e
      puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
    end
  end
end


