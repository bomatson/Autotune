require 'spec_helper'

describe TwitterCrawler do
  let(:fake_tweet) do
    tweet = FakeTweet.new
    tweet.text = "Check out #autotuneapp nine inch nails - closer #dowork #hookup"
    tweet
  end

  let(:crawler) { TwitterCrawler.new }

  describe "pre_process_tweet" do

    let(:processed) {crawler.pre_process_tweet(fake_tweet)}

    it "should have two moods" do
      processed.moods.size.should == 2
    end

    it "should have 2 search queries" do
      processed.search_queries.size.should == 2
    end

    it "should not have hash tags in the search queries" do
      processed.search_queries.first.include?("#").should be_false
    end

  end

end
