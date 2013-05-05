require "redis"

module Gesund::Checks
  class RedisConnection
    include Gesund::Check
    def initialize(options={})
      begin
        if ::Redis.new(options).ping == "PONG"
          self.pass "Redis PING = PONG"
        else
          self.fail "Redis PING != PONG"
        end
      rescue => e
        self.fail "#{self.class} ERROR: #{e.class}: #{e.message}"
      end
    end
  end
end
