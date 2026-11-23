=begin
File: knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 0-1 배낭: 완전 탐색 ###
def knapsack_dfs(wgt, val, i, c)
  # 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
  return 0 if i == 0 || c == 0
  # 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
  return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
  # 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
  no = knapsack_dfs(wgt, val, i - 1, c)
  yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
  # 두 경우 중 더 큰 가치를 반환한다
  [no, yes].max
end

### 0-1 배낭: 메모이제이션을 이용한 탐색 ###
def knapsack_dfs_mem(wgt, val, mem, i, c)
  # 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
  return 0 if i == 0 || c == 0
  # 기록이 이미 있으면 바로 반환한다
  return mem[i][c] if mem[i][c] != -1
  # 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
  return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
  # 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
  no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
  yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
  # 두 경우 중 더 큰 가치를 기록하고 반환한다
  mem[i][c] = [no, yes].max
end

### 0-1 배낭: 동적 계획법 ###
def knapsack_dp(wgt, val, cap)
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
        dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 0-1 배낭: 공간을 최적화한 동적 계획법 ###
def knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # dp 테이블을 초기화한다
  dp = Array.new(cap + 1, 0)
  # 상태 전이
  for i in 1...(n + 1)
    # 역방향 순회
    for c in cap.downto(1)
      if wgt[i - 1] > c
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
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # 완전 탐색
  res = knapsack_dfs(wgt, val, n, cap)
  puts "배낭 용량을 초과하지 않는 물건의 최대 가치는 #{res}이다"

  # 메모이제이션을 이용한 탐색
  mem = Array.new(n + 1) { Array.new(cap + 1, -1) }
  res = knapsack_dfs_mem(wgt, val, mem, n, cap)
  puts "배낭 용량을 초과하지 않는 물건의 최대 가치는 #{res}이다"

  # 동적 계획법
  res = knapsack_dp(wgt, val, cap)
  puts "배낭 용량을 초과하지 않는 물건의 최대 가치는 #{res}이다"

  # 공간을 최적화한 동적 계획법
  res = knapsack_dp_comp(wgt, val, cap)
  puts "배낭 용량을 초과하지 않는 물건의 최대 가치는 #{res}이다"
end
