=begin
File: iteration.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com), Cy (9738314@gmail.com)
=end

### for 迴圈 ###
def for_loop(n)
  res = 0

  # 迴圈加總 1, 2, ..., n-1, n
  for i in 1..n
    res += i
  end

  res
end

### while 迴圈 ###
def while_loop(n)
  res = 0
  i = 1 # 初始化條件變數

  # 迴圈加總 1, 2, ..., n-1, n
  while i <= n
    res += i
    i += 1 # 更新條件變數
  end

  res
end

### while 迴圈（更新兩次）###
def while_loop_ii(n)
  res = 0
  i = 1 # 初始化條件變數

  # 迴圈加總 1, 4, 10, ...
  while i <= n
    res += i
    # 更新條件變數
    i += 1
    i *= 2
  end

  res
end

### 雙層 for 迴圈 ###
def nested_for_loop(n)
  res = ""

  # 迴圈 i = 1, 2, ..., n-1, n
  for i in 1..n
    # 迴圈 j = 1, 2, ..., n-1, n
    for j in 1..n
      res += "(#{i}, #{j}), "
    end
  end

  res
end

### 主程式 ###
if __FILE__ == $0
  n = 5

  res = for_loop(n)
  puts "\nfor 迴圈的總和 res = #{res}"

  res = while_loop(n)
  puts "\nwhile 迴圈的總和 res = #{res}"

  res = while_loop_ii(n)
  puts "\nwhile 迴圈（更新兩次）的總和 res = #{res}"

  res = nested_for_loop(n)
  puts "\n雙層 for 迴圈走訪的結果 #{res}"
end
