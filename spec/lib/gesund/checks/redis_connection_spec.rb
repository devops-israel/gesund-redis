require "spec_helper"

describe Gesund::Checks::RedisConnection do
  it "passes when redis returns PONG on a ping" do
    ::Redis.stub_chain(:new, :ping).and_return("PONG")
    subject.success.should be_true
    subject.message.should match "Redis PING = PONG"
  end
  it "fails when redis returns non-PONG on a ping" do
    ::Redis.stub_chain(:new, :ping).and_return("something very bad")
    subject.success.should be_false
    subject.message.should match "Redis PING != PONG"
  end
  it "fails when redis raises an exception" do
    ::Redis.stub(:new).and_raise("something bad")
    subject.success.should be_false
    subject.message.should match "RedisConnection ERROR: RuntimeError: something bad"
  end
end
