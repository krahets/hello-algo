=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 回溯 ###
def backtrack(choices, state, n, res)
  # 当爬到第 n 阶时，方案数量加 1
  res[0] += 1 if state == n
  # 遍历所有选择
  for choice in choices
    # 剪枝：不允许越过第 n 阶
    next if state + choice > n

    # 尝试：做出选择，更新状态
    backtrack(choices, state + choice, n, res)
  end
  # 回退
end

### 爬楼梯：回溯 ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # 可选择向上爬 1 阶或 2 阶
  state = 0 # 从第 0 阶开始爬
  res = [0] # 使用 res[0] 记录方案数量
  backtrack(choices, state, n, res)
  res.first
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "爬 #{n} 阶楼梯共有 #{res} 种方案"
end
