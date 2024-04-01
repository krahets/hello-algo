=begin
File: iteration.rb
Created Time: 2024-04-01
Author: Cy (9738314@gmail.com)
=end

def for_loop(n)
  res = 0
  # 循环求和 1, 2, ..., n-1, n
  for i in 1..n do
    res += i
  end
  res
end

def while_loop(n)
  res = 0
  i = 1  # 初始化条件变量
  # 循环求和 1, 2, ..., n-1, n
  while i <= n
    res += i
    i = i + 1
  end
  res
end

def while_loop_ii(n)
  res = 0
  i = 1  # 初始化条件变量
  # 循环求和 1, 4, 10, ...
  while i <= n
    res += i
    # 更新条件变量
    i = i + 1
    i = i * 2
  end
  res
end

def nested_for_loop(n)
  res = ""
  # 循环 i = 1, 2, ..., n-1, n
  for i in 1..n do
    # 循环 j = 1, 2, ..., n-1, n
  for j in 1..n do
      res += "(#{i}, #{j}), "
    end
  end
  res
end

### Driver Code ###
n = 5
res = for_loop(n)
print "for 循环的求和结果 res = %d\n" % [res]

res = while_loop(n)
print "while 循环的求和结果 res = %d\n" % [res]

res = while_loop_ii(n)
print "while 循环（两次更新）求和结果 res = %d\n" % [res]

res = nested_for_loop(n)
print "双层 for 循环的遍历结果 %s" % [res]
