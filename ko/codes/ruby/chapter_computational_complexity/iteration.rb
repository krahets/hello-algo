=begin
File: iteration.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com), Cy (9738314@gmail.com)
=end

### for 문 ###
def for_loop(n)
  res = 0

  # 1, 2, ..., n-1, n을 차례로 더한다
  for i in 1..n
    res += i
  end

  res
end

### while 문 ###
def while_loop(n)
  res = 0
  i = 1 # 반복 조건에 쓰는 변수를 초기화한다

  # 1, 2, ..., n-1, n을 차례로 더한다
  while i <= n
    res += i
    i += 1 # 반복 조건에 쓰는 변수를 갱신한다
  end

  res
end

### while 문(한 번에 두 번 갱신)###
def while_loop_ii(n)
  res = 0
  i = 1 # 반복 조건에 쓰는 변수를 초기화한다

  # 1, 4, 10, ...을 차례로 더한다
  while i <= n
    res += i
    # 반복 조건에 쓰는 변수를 갱신한다
    i += 1
    i *= 2
  end

  res
end

### 이중 for 문 ###
def nested_for_loop(n)
  res = ""

  # i = 1, 2, ..., n-1, n에 대해 반복한다
  for i in 1..n
    # j = 1, 2, ..., n-1, n에 대해 반복한다
    for j in 1..n
      res += "(#{i}, #{j}), "
    end
  end

  res
end

### 실행 예제 ###
if __FILE__ == $0
  n = 5

  res = for_loop(n)
  puts "\nfor 문의 합 res = #{res}"

  res = while_loop(n)
  puts "\nwhile 문의 합 res = #{res}"

  res = while_loop_ii(n)
  puts "\nwhile 문(두 번 갱신)의 합 res = #{res}"

  res = nested_for_loop(n)
  puts "\n이중 for 문의 순회 결과: #{res}"
end
