=begin
File: max_capacity.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 最大容量：貪欲法 ###
def max_capacity(ht)
  # i, j を初期化し、配列の両端をそれぞれ指すようにする
  i, j = 0, ht.length - 1
  # 最大容量の初期値は 0
  res = 0

  # 2 枚の板が出会うまで貪欲な選択を繰り返す
  while i < j
    # 最大容量を更新する
    cap = [ht[i], ht[j]].min * (j - i)
    res = [res, cap].max
    # 低い方の仕切り板を内側に移動する
    if ht[i] < ht[j]
      i += 1
    else
      j -= 1
    end
  end

  res
end

### 実行用コード ###
if __FILE__ == $0
  ht = [3, 8, 5, 2, 7, 7, 3, 4]

  # 貪欲アルゴリズム
  res = max_capacity(ht)
  puts "最大容量は #{res}"
end
