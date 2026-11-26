=begin
File: climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 계단 오르기: 동적 계획법 ###
def climbing_stairs_dp(n)
  return n  if n == 1 || n == 2

  # 부분 문제의 해를 저장할 dp 테이블 초기화
  dp = Array.new(n + 1, 0)
  # 초기 상태: 가장 작은 부분 문제의 해를 설정한다
  dp[1], dp[2] = 1, 2
  # 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
  (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

  dp[n]
end

### 계단 오르기: 공간 최적화 동적 계획법 ###
def climbing_stairs_dp_comp(n)
  return n if n == 1 || n == 2

  a, b = 1, 2
  (3...(n + 1)).each { a, b = b, a + b }

  b
end

### 실행 예제 ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dp(n)
  puts "계단 #{n}개를 오르는 방법은 #{res}가지"

  res = climbing_stairs_dp_comp(n)
  puts "계단 #{n}개를 오르는 방법은 #{res}가지"
end
