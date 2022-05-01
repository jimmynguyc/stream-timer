require 'active_support'
require 'active_support/core_ext/integer'
require 'active_support/core_ext/string'

def reset
  File.write('stream-timer.txt', "00:00:00")
end
Signal.trap("INT") { reset; exit }

mode = ARGV[0] ? :countdown : :countup
count_timer = if mode == :countdown
  seconds = ARGV[0].to_i.send(ARGV[1].to_sym).seconds
  Time.at(seconds).utc
else
  Time.at(0).utc
end

loop do
  time_str = count_timer.strftime("%H:%M:%S")
  print "#{time_str}\r"
  File.write('stream-timer.txt', time_str)

  break if mode == :countdown && count_timer.seconds_since_midnight == 0
  operand = mode == :countdown ? -1 : 1
  count_timer += operand.second

  sleep 1
end

reset
