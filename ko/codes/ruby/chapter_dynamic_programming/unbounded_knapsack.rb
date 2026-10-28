=begin
File: unbounded_knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 무한 배낭: 동적 계획법 ###
def unbounded_knapsack_dp(wgt, val, cap)
  n = wgt.length
  # dp 테이블을 초기화한다
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # 상태 전이
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # 배낭 용량을 초과하면 물건 i를 선택하지 않는다
        dp[i][c] = dp[i - 1][c]
      else
        # 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
        dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 무한 배낭: 공간을 최적화한 동적 계획법 ##3
def unbounded_knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # dp 테이블을 초기화한다
  dp = Array.new(cap + 1, 0)
  # 상태 전이
  for i in 1...(n + 1)
    # 정방향 순회
    for c in 1...(cap + 1)
      if wgt[i -1] > c
        # 배낭 용량을 초과하면 물건 i를 선택하지 않는다
        dp[c] = dp[c]
      else
        # 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
        dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[cap]
end

### 실행 코드 ###
if __FILE__ == $0
  wgt = [1, 2, 3]
  val = [5, 11, 15]
  cap = 4

  # 동적 계획법
  res = unbounded_knapsack_dp(wgt, val, cap)
  puts "배낭 용량을 초과하지 않는 물건의 최대 가치는 #{res}이다"

  # 공간을 최적화한 동적 계획법
  res = unbounded_knapsack_dp_comp(wgt, val, cap)
  puts "배낭 용량을 초과하지 않는 물건의 최대 가치는 #{res}이다"
end
