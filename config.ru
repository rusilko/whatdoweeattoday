log = File.new("log/sinatra.log", "a+")
log.sync = true
STDOUT.reopen(log)
STDERR.reopen(log)

require File.expand_path('../app', __FILE__)

run Sinatra::Application
