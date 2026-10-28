=begin
File: recursion.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 재귀 ###
def recur(n)
  # 종료 조건
  return 1 if n == 1
  # 내려가기: 재귀 호출
  res = recur(n - 1)
  # 돌아오기: 결과 반환
  n + res
end

### 반복으로 재귀 구현 ###
def for_loop_recur(n)
  # 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
  stack = []
  res = 0

  # 내려가기: 재귀 호출
  for i in n.downto(0)
    # 스택에 삽입하여 내려가는 과정을 모방한다
    stack << i
  end
  # 돌아오기: 결과 반환
  while !stack.empty?
    res += stack.pop
  end

  # res = 1+2+3+...+n
  res
end

### 꼬리 재귀 ###
def tail_recur(n, res)
  # 종료 조건
  return res if n == 0
  # 꼬리 재귀 호출
  tail_recur(n - 1, res + n)
end

### 피보나치 수열: 재귀 ###
def fib(n)
  # 종료 조건 f(1) = 0, f(2) = 1
  return n - 1 if n == 1 || n == 2
  # 재귀 호출 f(n) = f(n-1) + f(n-2)
  res = fib(n - 1) + fib(n - 2)
  # 결과 f(n)을 반환한다
  res
end

### 실행 코드 ###
if __FILE__ == $0
  n = 5

  res = recur(n)
  puts "\n재귀 함수로 구한 합 res = #{res}"

  res = for_loop_recur(n)
  puts "\n반복으로 재귀를 구현하여 구한 합 res = #{res}"

  res = tail_recur(n, 0)
  puts "\n꼬리 재귀 함수로 구한 합 res = #{res}"

  res = fib(n)
  puts "\n피보나치 수열의 #{n}번째 항은 #{res}이다"
end
