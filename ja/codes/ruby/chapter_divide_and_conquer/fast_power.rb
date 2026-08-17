=begin
File: fast_power.rb
Created Time: 2026-08-18
Author: Hello Algo Team
=end

### 高速べき乗 ###
def fast_pow(x, n)
  return 1 if n == 0

  half = fast_pow(x, n / 2)
  return half * half if n.even?

  half * half * x
end

if __FILE__ == $0
  raise 'fast power check failed' unless fast_pow(7, 0) == 1
  raise 'fast power check failed' unless fast_pow(3, 5) == 243
  raise 'fast power check failed' unless fast_pow(2, 6) == 64
end
