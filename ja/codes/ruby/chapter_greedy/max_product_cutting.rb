=begin
File: max_product_cutting.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 最大分割積：貪欲法 ###
def max_product_cutting(n)
  # n <= 3 のときは、必ず 1 を切り出す
  return 1 * (n - 1) if n <= 3
  # 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
  a, b = n / 3, n % 3
  # 余りが 1 のときは、1 * 3 を 2 * 2 に変える
  return (3.pow(a - 1) * 2 * 2).to_i if b == 1
  # 余りが 2 のときは、そのままにする
  return (3.pow(a) * 2).to_i if b == 2
  # 余りが 0 のときは、そのままにする
  3.pow(a).to_i
end

### Driver Code ###
if __FILE__ == $0
  n = 58

  # 貪欲法
  res = max_product_cutting(n)
  puts "最大分割積は #{res}"
end
