=begin
File: min_cost_climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 계단 오르기의 최소 비용: 동적 계획법 ###
def min_cost_climbing_stairs_dp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  # 부분 문제의 해를 저장할 dp 테이블을 초기화한다
  dp = Array.new(n + 1, 0)
  # 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
  dp[1], dp[2] = cost[1], cost[2]
  # 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
  (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
  dp[n]
end

# 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법
def min_cost_climbing_stairs_dp_comp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  a, b = cost[1], cost[2]
  (3...(n + 1)).each { |i| a, b = b, [a, b].min + cost[i] }
  b
end

### 실행 코드 ###
if __FILE__ == $0
  cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
  puts "입력한 계단의 비용 리스트: #{cost}"

  res = min_cost_climbing_stairs_dp(cost)
  puts "계단을 모두 오르는 최소 비용: #{res}"

  res = min_cost_climbing_stairs_dp_comp(cost)
  puts "계단을 모두 오르는 최소 비용: #{res}"
end
