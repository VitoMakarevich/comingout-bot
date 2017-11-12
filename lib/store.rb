require 'redis'

# like-orm class
class Store
  def initialize
    @redis = Redis.new
  end

  def is?(key)
    @redis.get(key)
  end

  def add(key, data)
    @redis.set(key, data)
  end
end
