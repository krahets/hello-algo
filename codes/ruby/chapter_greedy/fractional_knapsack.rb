=begin
File: fractional_knapsack.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 物品 ###
class Item
  attr_accessor :w # 物品重量
  attr_accessor :v # 物品价值

  def initialize(w, v)
    @w = w
    @v = v
  end
end

### 分数背包：贪心 ###
def fractional_knapsack(wgt, val, cap)
  # 创建物品列表，包含两个属性：重量，价值
  items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
  # 按照单位价值 item.v / item.w 从高到低进行排序
  items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
  # 循环贪心选择
  res = 0
  for item in items
    if item.w <= cap
      # 若剩余容量充足，则将当前物品整个装进背包
      res += item.v
      cap -= item.w
    else
      # 若剩余容量不足，则将当前物品的一部分装进背包
      res += (item.v.to_f / item.w) * cap
      # 已无剩余容量，因此跳出循环
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

  # 贪心算法
  res = fractional_knapsack(wgt, val, cap)
  puts "不超过背包容量的最大物品价值为 #{res}"
end
