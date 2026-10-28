=begin
File: coin_change_ii.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 동전 교환 II: 동적 계획법 ###
def coin_change_ii_dp(coins, amt)
  n = coins.length
  # dp 테이블을 초기화한다
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # 첫 번째 열을 초기화한다
  (0...(n + 1)).each { |i| dp[i][0] = 1 }
  # 상태 전이
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 목표 금액을 초과하면 동전 i를 선택하지 않는다
        dp[i][a] = dp[i - 1][a]
      else
        # 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
      end
    end
  end
  dp[n][amt]
end

### 동전 교환 II: 공간을 최적화한 동적 계획법 ###
def coin_change_ii_dp_comp(coins, amt)
  n = coins.length
  # dp 테이블을 초기화한다
  dp = Array.new(amt + 1, 0)
  dp[0] = 1
  # 상태 전이
  for i in 1...(n + 1)
    # 정방향 순회
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 목표 금액을 초과하면 동전 i를 선택하지 않는다
        dp[a] = dp[a]
      else
        # 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
        dp[a] = dp[a] + dp[a - coins[i - 1]]
      end
    end
  end
  dp[amt]
end

### 실행 코드 ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 5

  # 동적 계획법
  res = coin_change_ii_dp(coins, amt)
  puts "목표 금액을 만드는 동전 조합의 수는 #{res}개이다"

  # 공간을 최적화한 동적 계획법
  res = coin_change_ii_dp_comp(coins, amt)
  puts "목표 금액을 만드는 동전 조합의 수는 #{res}개이다"
end
