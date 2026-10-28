=begin
File: climbing_stairs_dfs_mem.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 메모이제이션을 이용한 탐색 ###
def dfs(i, mem)
  # dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
  return i if i == 1 || i == 2
  # dp[i]의 기록이 있으면 해당 값을 바로 반환한다
  return mem[i] if mem[i] != -1

  # dp[i] = dp[i-1] + dp[i-2]
  count = dfs(i - 1, mem) + dfs(i - 2, mem)
  # dp[i]를 기록한다
  mem[i] = count
end

### 계단 오르기: 메모이제이션을 이용한 탐색 ###
def climbing_stairs_dfs_mem(n)
  # mem[i]는 i번째 계단까지 오르는 전체 방법의 수를 기록하며, -1은 기록이 없음을 나타낸다
  mem = Array.new(n + 1, -1)
  dfs(n, mem)
end

### 실행 코드 ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs_mem(n)
  puts "#{n}개의 계단을 오르는 방법은 총 #{res}가지이다"
end
