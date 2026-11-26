=begin
File: coin_change.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 동전 교환: 동적 계획법 ###
def coin_change_dp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # dp 테이블 초기화
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # 상태 전이: 첫 행과 첫 열
  (1...(amt + 1)).each { |a| dp[0][a] = _MAX }
  # 상태 전이: 나머지 행과 열
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 목표 금액을 넘으면 동전 i를 선택하지 않는다
        dp[i][a] = dp[i - 1][a]
      else
        # 동전 i를 선택하지 않을 때와 선택할 때 중 작은 값
        dp[i][a] = [dp[i - 1][a], dp[i][a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[n][amt] != _MAX ? dp[n][amt] : -1
end

### 동전 교환: 공간 최적화 동적 계획법 ###
def coin_change_dp_comp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # dp 테이블 초기화
  dp = Array.new(amt + 1, _MAX)
  dp[0] = 0
  # 상태 전이
  for i in 1...(n + 1)
    # 정순으로 순회
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 목표 금액을 넘으면 동전 i를 선택하지 않는다
        dp[a] = dp[a]
      else
        # 동전 i를 선택하지 않을 때와 선택할 때 중 작은 값
        dp[a] = [dp[a], dp[a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[amt] != _MAX ? dp[amt] : -1
end

### 실행 예제 ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 4

  # 동적 계획법
  res = coin_change_dp(coins, amt)
  puts "목표 금액을 만드는 데 필요한 최소 동전 수: #{res}"

  # 공간 최적화 동적 계획법
  res = coin_change_dp_comp(coins, amt)
  puts "목표 금액을 만드는 데 필요한 최소 동전 수: #{res}"
end
