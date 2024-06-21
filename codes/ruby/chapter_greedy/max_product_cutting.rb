=begin
File: max_product_cutting.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 最大切分乘积：贪心 ###
def max_product_cutting(n)
  # 当 n <= 3 时，必须切分出一个 1
  return 1 * (n - 1) if n <= 3
  # 贪心地切分出 3 ，a 为 3 的个数，b 为余数
  a, b = n / 3, n % 3
  # 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
  return (3.pow(a - 1) * 2 * 2).to_i if b == 1
  # 当余数为 2 时，不做处理
  return (3.pow(a) * 2).to_i if b == 2
  # 当余数为 0 时，不做处理
  3.pow(a).to_i
end

### Driver Code ###
if __FILE__ == $0
  n = 58

  # 贪心算法
  res = max_product_cutting(n)
  puts "最大切分乘积为 #{res}"
end
