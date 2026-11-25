=begin
File: climbing_stairs_dfs_mem.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 메모이제이션 탐색 ###
def dfs(i, mem)
  # 이미 아는 dp[1]과 dp[2]의 값 중 해당 값을 반환한다
  return i if i == 1 || i == 2
  # dp[i]의 기록이 있으면 바로 반환한다
  return mem[i] if mem[i] != -1

  # dp[i] = dp[i-1] + dp[i-2]
  count = dfs(i - 1, mem) + dfs(i - 2, mem)
  # dp[i] 기록
  mem[i] = count
end

### 계단 오르기: 메모이제이션 탐색 ###
def climbing_stairs_dfs_mem(n)
  # mem[i]에 i번째 계단까지 오르는 방법 수를 기록한다. -1은 기록이 없음을 뜻한다
  mem = Array.new(n + 1, -1)
  dfs(n, mem)
end

### 실행 예제 ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs_mem(n)
  puts "계단 #{n}개를 오르는 방법은 #{res}가지"
end
