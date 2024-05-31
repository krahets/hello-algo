=begin
File: max_capacity.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 最大容量：貪婪 ###
def max_capacity(ht)
  # 初始化 i, j，使其分列陣列兩端
  i, j = 0, ht.length - 1
  # 初始最大容量為 0
  res = 0

  # 迴圈貪婪選擇，直至兩板相遇
  while i < j
    # 更新最大容量
    cap = [ht[i], ht[j]].min * (j - i)
    res = [res, cap].max
    # 向內移動短板
    if ht[i] < ht[j]
      i += 1
    else
      j -= 1
    end
  end

  res
end

### Driver Code ###
if __FILE__ == $0
  ht = [3, 8, 5, 2, 7, 7, 3, 4]

  # 貪婪演算法
  res = max_capacity(ht)
  puts "最大容量為 #{res}"
end
