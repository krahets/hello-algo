=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 回溯 ###
def backtrack(choices, state, n, res)
  # 當爬到第 n 階時，方案數量加 1
  res[0] += 1 if state == n
  # 走訪所有選擇
  for choice in choices
    # 剪枝：不允許越過第 n 階
    next if state + choice > n

    # 嘗試：做出選擇，更新狀態
    backtrack(choices, state + choice, n, res)
  end
  # 回退
end

### 爬樓梯：回溯 ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # 可選擇向上爬 1 階或 2 階
  state = 0 # 從第 0 階開始爬
  res = [0] # 使用 res[0] 記錄方案數量
  backtrack(choices, state, n, res)
  res.first
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "爬 #{n} 階樓梯共有 #{res} 種方案"
end
