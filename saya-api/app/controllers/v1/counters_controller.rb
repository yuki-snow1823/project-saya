class V1::CountersController < ApplicationController

  def show
    @counter = Counter.find(1)
    
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["API_KEY"]
      config.consumer_secret     = ENV["API_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end

    # https://api.twitter.com/2/tweets/search/recent?query=python -H "Authorization: Bearer $BEARER_TOKEN"
    @test = client.search("#朱鷺戸沙耶生誕祭2020", result_type: "recent").take(6).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
    render json: {test: @counter, add:@test}
  end

  def update
    @counter = Counter.find(1)
    @counter.count = @counter.count + 1
    @counter.save

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["API_KEY"]
      config.consumer_secret     = ENV["API_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end

    # https://api.twitter.com/2/tweets/search/recent?query=python -H "Authorization: Bearer $BEARER_TOKEN"
    @test = client.search("#朱鷺戸沙耶生誕祭2020", result_type: "recent").take(5).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end

    render json: {test: @counter, add: @test}
  end

  # private
  # def counter_params
  #   params.require(:counter).permit(:count)
  # end

end
