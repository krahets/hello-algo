=begin
File: iteration.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com), Cy (9738314@gmail.com)
=end

### for 循环 ###
def for_loop(n)
  res = 0

  # 循环求和 1, 2, ..., n-1, n
  for i in 1..n
    res += i
  end

  res
end

### while 循环 ###
def while_loop(n)
  res = 0
  i = 1 # 初始化条件变量

  # 循环求和 1, 2, ..., n-1, n
  while i <= n
    res += i
    i += 1 # 更新条件变量
  end

  res
end

### while 循环（两次更新）###
def while_loop_ii(n)
  res = 0
  i = 1 # 初始化条件变量

  # 循环求和 1, 4, 10, ...
  while i <= n
    res += i
    # 更新条件变量
    i += 1
    i *= 2
  end

  res
end

### 双层 for 循环 ###
def nested_for_loop(n)
  res = ""

  # 循环 i = 1, 2, ..., n-1, n
  for i in 1..n
    # 循环 j = 1, 2, ..., n-1, n
    for j in 1..n
      res += "(#{i}, #{j}), "
    end
  end

  res
end

### Driver Code ###
if __FILE__ == $0
  n = 5

  res = for_loop(n)
  puts "\nfor 循环的求和结果 res = #{res}"

  res = while_loop(n)
  puts "\nwhile 循环的求和结果 res = #{res}"

  res = while_loop_ii(n)
  puts "\nwhile 循环（两次更新）求和结果 res = #{res}"

  res = nested_for_loop(n)
  puts "\n双层 for 循环的遍历结果 #{res}"
end
