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

### 分數背包：貪婪法 ###
def fractional_knapsack(wgt, val, cap)
  # 建立物品清單，每件物品有重量與價值兩項屬性
  items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
  # 依單位價值 item.v / item.w 由高到低排序
  items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
  # 反覆依貪婪策略選取物品
  res = 0
  for item in items
    if item.w <= cap
      # 若剩餘容量足夠，就將目前的物品整件裝入背包
      res += item.v
      cap -= item.w
    else
      # 若剩餘容量不足，就將目前物品的一部分裝入背包
      res += (item.v.to_f / item.w) * cap
      # 背包已滿，跳出迴圈
      break
    end
  end
  res
end

### 主程式 ###
if __FILE__ == $0
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # 貪婪演算法
  res = fractional_knapsack(wgt, val, cap)
  puts "在背包容量限制內，物品的最大總價值為 #{res}"
end
