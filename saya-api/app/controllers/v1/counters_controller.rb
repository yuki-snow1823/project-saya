class V1::CountersController < ApplicationController
  include TwitterService
  
  def show
    # au = authorization.new # concernのクラスのインスタンス化の実体を入れる
    # 今回は実体化させずにselfメソッドで実行
    client = Authorization.init
    @counter = Counter.find(1)
    @data = client.search("#朱鷺戸沙耶生誕祭2020", result_type: "recent").take(4).collect do |tweet|
      {
        "image": "#{tweet.user.profile_image_url.to_s.gsub('http', 'https')}",
        "name": "#{tweet.user.name}",
        "text": "#{tweet.full_text}",
        "tweet_link": "#{tweet.uri}"
      }
    end
    render json: {count: @counter, tweet: @data}
  end

  def update
    # concernのメソッド呼び出し
    client = Authorization.init
    @counter = Counter.find(1)
    @counter.count = @counter.count + 1
    @counter.save

    @data = client.search("#朱鷺戸沙耶生誕祭2020", result_type: "recent").take(4).collect do |tweet|
      {
        "image": "#{tweet.user.profile_image_url}",
        "name": "#{tweet.user.name}",
        "text": "#{tweet.full_text}",
        "tweet_link": "#{tweet.uri}"
      }
    end

    render json: {count: @counter, tweet: @data}
  end

end
