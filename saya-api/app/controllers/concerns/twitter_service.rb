module TwitterService
  extend ActiveSupport::Concern # 呼べる範囲を広げる

  class Authorization
    def self.init # newをしなくてよくする
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["API_KEY"]
        config.consumer_secret     = ENV["API_SECRET"]
        config.access_token        = ENV["ACCESS_TOKEN"]
        config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
      end
      return client # 可視化
    end
  end

end 
