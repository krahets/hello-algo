=begin
File: fractional_knapsack.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 品物 ###
class Item
  attr_accessor :w # 品物の重さ
  attr_accessor :v # 品物の価値

  def initialize(w, v)
    @w = w
    @v = v
  end
end

### 分割可能ナップサック（貪欲法） ###
def fractional_knapsack(wgt, val, cap)
  # 重さと価値の 2 つの属性を持つ品物のリストを作る
  items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
  # 単位重量あたりの価値 item.v / item.w の降順にソートする
  items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
  # 貪欲選択を繰り返す
  res = 0
  for item in items
    if item.w <= cap
      # 残り容量が十分なら、現在の品物を丸ごと入れる
      res += item.v
      cap -= item.w
    else
      # 残り容量が足りなければ、現在の品物の一部を入れる
      res += (item.v.to_f / item.w) * cap
      # 残り容量がないためループを抜ける
      break
    end
  end
  res
end

### 実行例 ###
if __FILE__ == $0
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # 貪欲法
  res = fractional_knapsack(wgt, val, cap)
  puts "容量内で得られる品物の合計価値の最大値は #{res}"
end
