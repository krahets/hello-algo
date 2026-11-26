=begin
File: unbounded_knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 무한 배낭: 동적 계획법 ###
def unbounded_knapsack_dp(wgt, val, cap)
  n = wgt.length
  # dp 테이블 초기화
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # 상태 전이
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # 배낭 용량을 넘으면 물건 i를 선택하지 않는다
        dp[i][c] = dp[i - 1][c]
      else
        # 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
        dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 무한 배낭: 공간 최적화 동적 계획법 ###
def unbounded_knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # dp 테이블 초기화
  dp = Array.new(cap + 1, 0)
  # 상태 전이
  for i in 1...(n + 1)
    # 정순으로 순회
    for c in 1...(cap + 1)
      if wgt[i -1] > c
        # 배낭 용량을 넘으면 물건 i를 선택하지 않는다
        dp[c] = dp[c]
      else
        # 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
        dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[cap]
end

### 실행 예제 ###
if __FILE__ == $0
  wgt = [1, 2, 3]
  val = [5, 11, 15]
  cap = 4

  # 동적 계획법
  res = unbounded_knapsack_dp(wgt, val, cap)
  puts "배낭 용량 내에서 얻는 최대 가치: #{res}"

  # 공간 최적화 동적 계획법
  res = unbounded_knapsack_dp_comp(wgt, val, cap)
  puts "배낭 용량 내에서 얻는 최대 가치: #{res}"
end
