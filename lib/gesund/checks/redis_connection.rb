require "redis"

module Gesund::Checks
  class RedisConnection
    include Gesund::Check
    def initialize(options)
      begin
        self.success = (::Redis.new(options).ping == "PONG")
        self.message = "Redis PING = PONG"
      rescue => e
        self.message = "#{e.class}: #{e.message}"
        self.success = false
      end
    end
  end
end
