=begin
File: fractional_knapsack.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### アイテム ###
class Item
  attr_accessor :w # 品物の重さ
  attr_accessor :v # 品物の価値

  def initialize(w, v)
    @w = w
    @v = v
  end
end

### 分数ナップサック：貪欲法 ###
def fractional_knapsack(wgt, val, cap)
  # 重さと価値の 2 属性を持つ品物リストを作成する
  items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
  # 単位価値 item.v / item.w の高い順にソートする
  items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
  # 貪欲選択を繰り返す
  res = 0
  for item in items
    if item.w <= cap
      # 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
      res += item.v
      cap -= item.w
    else
      # 残り容量が足りない場合は、現在の品物の一部だけをナップサックに入れる
      res += (item.v.to_f / item.w) * cap
      # 残り容量がないため、ループを抜ける
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

  # 貪欲法
  res = fractional_knapsack(wgt, val, cap)
  puts "ナップサック容量を超えない最大価値は #{res}"
end
