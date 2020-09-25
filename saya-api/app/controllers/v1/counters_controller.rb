class V1::CountersController < ApplicationController
  include TwitterService
  
  def show
    # au = authorization.new # concernのクラスのインスタンス化の実体を入れる
    # 今回は実体化させずにselfメソッドで実行
    client = Authorization.init

    @counter = Counter.find(1)

    @test = client.search("#朱鷺戸沙耶生誕祭2020", result_type: "recent").take(4).collect do |tweet|
      # "#{tweet.user.profile_image_url}"
      {
        "image": "#{tweet.user.profile_image_url}",
        "name": "#{tweet.user.name}",
        "text": "#{tweet.full_text}",
        "tweet_link": "#{tweet.uri}"
      }
      # binding.pry
    end

    render json: {test: @counter, add: @test}
  end

  def update
    client = Authorization.init # concernのメソッド呼び出し

    @counter = Counter.find(1)
    @counter.count = @counter.count + 1
    @counter.save

    @test = client.search("#朱鷺戸沙耶生誕祭2020", result_type: "recent").take(4).collect do |tweet|
      # "#{tweet.user.profile_image_url}"
      {
        "image": "#{tweet.user.profile_image_url}",
        "name": "#{tweet.user.name}",
        "text": "#{tweet.full_text}",
        "tweet_link": "#{tweet.uri}"
      }
      # binding.pry
    end

    render json: {test: @counter, add: @test}
  end

  # private
  # def counter_params
  #   params.require(:counter).permit(:count)
  # end

end
