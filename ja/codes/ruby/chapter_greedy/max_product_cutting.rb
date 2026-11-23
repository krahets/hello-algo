=begin
File: max_product_cutting.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 分割後の積の最大化：貪欲法 ###
def max_product_cutting(n)
  # n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
  return 1 * (n - 1) if n <= 3
  # 貪欲に 3 を切り出す。a は 3 の個数、b は余り
  a, b = n / 3, n % 3
  # 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
  return (3.pow(a - 1) * 2 * 2).to_i if b == 1
  # 余りが 2 の場合、何もしない
  return (3.pow(a) * 2).to_i if b == 2
  # 余りが 0 の場合、何もしない
  3.pow(a).to_i
end

### 実行用コード ###
if __FILE__ == $0
  n = 58

  # 貪欲アルゴリズム
  res = max_product_cutting(n)
  puts "分割後の積の最大値は #{res}"
end
