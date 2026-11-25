=begin
File: max_capacity.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 最大容量（貪欲法） ###
def max_capacity(ht)
  # i と j を配列の両端に置く
  i, j = 0, ht.length - 1
  # 最大容量の初期値は 0
  res = 0

  # 両方の板が同じ位置に来るまで貪欲選択を繰り返す
  while i < j
    # 最大容量を更新する
    cap = [ht[i], ht[j]].min * (j - i)
    res = [res, cap].max
    # 低い板のポインタを内側へ動かす
    if ht[i] < ht[j]
      i += 1
    else
      j -= 1
    end
  end

  res
end

### 実行例 ###
if __FILE__ == $0
  ht = [3, 8, 5, 2, 7, 7, 3, 4]

  # 貪欲法
  res = max_capacity(ht)
  puts "最大容量は #{res}"
end
