class V1::CountersController < ApplicationController

  def show
    @counter = Counter.find(1)
    render json: {test: @counter}
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

    @test = client.status(27558893223)
    render json: {test: @counter, add: @test}
  end

  # private
  # def counter_params
  #   params.require(:counter).permit(:count)
  # end

end
