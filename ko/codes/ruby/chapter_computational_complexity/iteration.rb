=begin
File: iteration.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com), Cy (9738314@gmail.com)
=end

### for 반복문 ###
def for_loop(n)
  res = 0

  # 반복문으로 1, 2, ..., n-1, n의 합을 구한다
  for i in 1..n
    res += i
  end

  res
end

### while 반복문 ###
def while_loop(n)
  res = 0
  i = 1 # 조건 변수를 초기화한다

  # 반복문으로 1, 2, ..., n-1, n의 합을 구한다
  while i <= n
    res += i
    i += 1 # 조건 변수를 갱신한다
  end

  res
end

### while 반복문(두 번 갱신)###
def while_loop_ii(n)
  res = 0
  i = 1 # 조건 변수를 초기화한다

  # 반복문으로 1, 4, 10, ...의 합을 구한다
  while i <= n
    res += i
    # 조건 변수를 갱신한다
    i += 1
    i *= 2
  end

  res
end

### 이중 for 반복문 ###
def nested_for_loop(n)
  res = ""

  # i = 1, 2, ..., n-1, n을 반복한다
  for i in 1..n
    # j = 1, 2, ..., n-1, n을 반복한다
    for j in 1..n
      res += "(#{i}, #{j}), "
    end
  end

  res
end

### 실행 코드 ###
if __FILE__ == $0
  n = 5

  res = for_loop(n)
  puts "\nfor 반복문으로 구한 합 res = #{res}"

  res = while_loop(n)
  puts "\nwhile 반복문으로 구한 합 res = #{res}"

  res = while_loop_ii(n)
  puts "\nwhile 반복문(두 번 갱신)으로 구한 합 res = #{res}"

  res = nested_for_loop(n)
  puts "\n이중 for 반복문의 순회 결과 #{res}"
end
