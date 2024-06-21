=begin
File: iteration.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com), Cy (9738314@gmail.com)
=end

### for 迴圈 ###
def for_loop(n)
  res = 0

  # 迴圈求和 1, 2, ..., n-1, n
  for i in 1..n
    res += i
  end

  res
end

### while 迴圈 ###
def while_loop(n)
  res = 0
  i = 1 # 初始化條件變數

  # 迴圈求和 1, 2, ..., n-1, n
  while i <= n
    res += i
    i += 1 # 更新條件變數
  end

  res
end

### while 迴圈（兩次更新）###
def while_loop_ii(n)
  res = 0
  i = 1 # 初始化條件變數

  # 迴圈求和 1, 4, 10, ...
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

### Driver Code ###
if __FILE__ == $0
  n = 5

  res = for_loop(n)
  puts "\nfor 迴圈的求和結果 res = #{res}"

  res = while_loop(n)
  puts "\nwhile 迴圈的求和結果 res = #{res}"

  res = while_loop_ii(n)
  puts "\nwhile 迴圈（兩次更新）求和結果 res = #{res}"

  res = nested_for_loop(n)
  puts "\n雙層 for 迴圈的走訪結果 #{res}"
end
