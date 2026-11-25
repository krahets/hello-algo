=begin
File: knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 0-1 배낭: 완전 탐색 ###
def knapsack_dfs(wgt, val, i, c)
  # 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
  return 0 if i == 0 || c == 0
  # 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
  return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
  # 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
  no = knapsack_dfs(wgt, val, i - 1, c)
  yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
  # 두 경우 중 큰 가치를 반환한다
  [no, yes].max
end

### 0-1 배낭: 메모이제이션 탐색 ###
def knapsack_dfs_mem(wgt, val, mem, i, c)
  # 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
  return 0 if i == 0 || c == 0
  # 기록이 있으면 바로 반환한다
  return mem[i][c] if mem[i][c] != -1
  # 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
  return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
  # 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
  no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
  yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
  # 두 경우 중 큰 가치를 기록하고 반환한다
  mem[i][c] = [no, yes].max
end

### 0-1 배낭: 동적 계획법 ###
def knapsack_dp(wgt, val, cap)
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
        dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 0-1 배낭: 공간 최적화 동적 계획법 ###
def knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # dp 테이블 초기화
  dp = Array.new(cap + 1, 0)
  # 상태 전이
  for i in 1...(n + 1)
    # 역순으로 순회
    for c in cap.downto(1)
      if wgt[i - 1] > c
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
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # 완전 탐색
  res = knapsack_dfs(wgt, val, n, cap)
  puts "배낭 용량 내에서 얻는 최대 가치: #{res}"

  # 메모이제이션 탐색
  mem = Array.new(n + 1) { Array.new(cap + 1, -1) }
  res = knapsack_dfs_mem(wgt, val, mem, n, cap)
  puts "배낭 용량 내에서 얻는 최대 가치: #{res}"

  # 동적 계획법
  res = knapsack_dp(wgt, val, cap)
  puts "배낭 용량 내에서 얻는 최대 가치: #{res}"

  # 공간 최적화 동적 계획법
  res = knapsack_dp_comp(wgt, val, cap)
  puts "배낭 용량 내에서 얻는 최대 가치: #{res}"
end
