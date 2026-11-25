=begin
File: max_product_cutting.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 整数分割の最大積（貪欲法） ###
def max_product_cutting(n)
  # n <= 3 の場合は必ず 1 を切り出す
  return 1 * (n - 1) if n <= 3
  # 貪欲に 3 を切り出す。a は 3 の個数、b は余り
  a, b = n / 3, n % 3
  # 余りが 1 なら、1 * 3 の組を 2 * 2 に置き換える
  return (3.pow(a - 1) * 2 * 2).to_i if b == 1
  # 余りが 2 なら、そのままにする
  return (3.pow(a) * 2).to_i if b == 2
  # 余りが 0 なら、そのままにする
  3.pow(a).to_i
end

### 実行例 ###
if __FILE__ == $0
  n = 58

  # 貪欲法
  res = max_product_cutting(n)
  puts "分割後の積の最大値は #{res}"
end
