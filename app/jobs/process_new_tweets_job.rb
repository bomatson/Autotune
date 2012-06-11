class ProcessNewTweetsJob
  @queue = :default

  def self.perform
    begin
      crawler = TwitterCrawler.new
      crawler.process_new_tweets
    rescue => ex
      Rails.logger.error(ex)
    ensure
      sleep(1)
      CRAWL_QUEUE.push({})
    end
  end
end