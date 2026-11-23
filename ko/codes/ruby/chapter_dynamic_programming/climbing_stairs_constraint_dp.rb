=begin
File: climbing_stairs_constraint_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 제약 조건이 있는 계단 오르기: 동적 계획법 ###
def climbing_stairs_constraint_dp(n)
  return 1 if n == 1 || n == 2

  # 부분 문제의 해를 저장할 dp 테이블을 초기화한다
  dp = Array.new(n + 1) { Array.new(3, 0) }
  # 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
  dp[1][1], dp[1][2] = 1, 0
  dp[2][1], dp[2][2] = 0, 1
  # 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
  for i in 3...(n + 1)
    dp[i][1] = dp[i - 1][2]
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
  end

  dp[n][1] + dp[n][2]
end

### 실행 코드 ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_constraint_dp(n)
  puts "#{n}개의 계단을 오르는 방법은 총 #{res}가지이다"
end
