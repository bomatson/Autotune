#require 'connection_pool'
#
#REDIS_POOL = ConnectionPool.new(size: 1, timeout: 5) {Redis.new}

#def create_gf_work_queue(name, &block)
#  GirlFriday::WorkQueue.new(name, store: GirlFriday::Store::Redis, store_config: {pool: REDIS_POOL}, &block)
#end

CRAWL_QUEUE = GirlFriday::WorkQueue.new(:crawl, size: 1) do |msg|
  ProcessNewTweetsJob.perform()
end

#queue initial job
CRAWL_QUEUE.push({})




