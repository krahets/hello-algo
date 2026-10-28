=begin
File: coin_change.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 동전 교환: 동적 계획법 ###
def coin_change_dp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # dp 테이블을 초기화한다
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # 상태 전이: 첫 번째 행과 첫 번째 열
  (1...(amt + 1)).each { |a| dp[0][a] = _MAX }
  # 상태 전이: 나머지 행과 열
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 목표 금액을 초과하면 동전 i를 선택하지 않는다
        dp[i][a] = dp[i - 1][a]
      else
        # 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
        dp[i][a] = [dp[i - 1][a], dp[i][a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[n][amt] != _MAX ? dp[n][amt] : -1
end

### 동전 교환: 공간을 최적화한 동적 계획법 ###
def coin_change_dp_comp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # dp 테이블을 초기화한다
  dp = Array.new(amt + 1, _MAX)
  dp[0] = 0
  # 상태 전이
  for i in 1...(n + 1)
    # 정방향 순회
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 목표 금액을 초과하면 동전 i를 선택하지 않는다
        dp[a] = dp[a]
      else
        # 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
        dp[a] = [dp[a], dp[a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[amt] != _MAX ? dp[amt] : -1
end

### 실행 코드 ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 4

  # 동적 계획법
  res = coin_change_dp(coins, amt)
  puts "목표 금액을 만드는 데 필요한 최소 동전 개수는 #{res}개이다"

  # 공간을 최적화한 동적 계획법
  res = coin_change_dp_comp(coins, amt)
  puts "목표 금액을 만드는 데 필요한 최소 동전 개수는 #{res}개이다"
end
