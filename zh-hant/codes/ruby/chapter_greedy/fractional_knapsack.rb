=begin
File: fractional_knapsack.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 物品 ###
class Item
  attr_accessor :w # 物品重量
  attr_accessor :v # 物品價值

  def initialize(w, v)
    @w = w
    @v = v
  end
end

### 分數背包：貪婪 ###
def fractional_knapsack(wgt, val, cap)
  # 建立物品串列，包含兩個屬性：重量，價值
  items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
  # 按照單位價值 item.v / item.w 從高到低進行排序
  items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
  # 迴圈貪婪選擇
  res = 0
  for item in items
    if item.w <= cap
      # 若剩餘容量充足，則將當前物品整個裝進背包
      res += item.v
      cap -= item.w
    else
      # 若剩餘容量不足，則將當前物品的一部分裝進背包
      res += (item.v.to_f / item.w) * cap
      # 已無剩餘容量，因此跳出迴圈
      break
    end
  end
  res
end

### Driver Code ###
if __FILE__ == $0
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # 貪婪演算法
  res = fractional_knapsack(wgt, val, cap)
  puts "不超過背包容量的最大物品價值為 #{res}"
end
