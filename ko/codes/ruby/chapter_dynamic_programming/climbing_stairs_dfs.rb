=begin
File: climbing_stairs_dfs.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 탐색 ###
def dfs(i)
  # dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
  return i if i == 1 || i == 2
  # dp[i] = dp[i-1] + dp[i-2]
  dfs(i - 1) + dfs(i - 2)
end

### 계단 오르기: 탐색 ###
def climbing_stairs_dfs(n)
  dfs(n)
end

### 실행 코드 ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs(n)
  puts "#{n}개의 계단을 오르는 방법은 총 #{res}가지이다"
end
