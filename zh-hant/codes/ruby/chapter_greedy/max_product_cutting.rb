=begin
File: max_product_cutting.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 最大切分乘積：貪婪法 ###
def max_product_cutting(n)
  # 當 n <= 3 時，必須切出一個 1
  return 1 * (n - 1) if n <= 3
  # 依貪婪策略盡量切出 3，a 為 3 的個數，b 為餘數
  a, b = n / 3, n % 3
  # 若餘數為 1，將一組 1 * 3 改為 2 * 2
  return (3.pow(a - 1) * 2 * 2).to_i if b == 1
  # 若餘數為 2，無須調整
  return (3.pow(a) * 2).to_i if b == 2
  # 若餘數為 0，無須調整
  3.pow(a).to_i
end

### 主程式 ###
if __FILE__ == $0
  n = 58

  # 貪婪演算法
  res = max_product_cutting(n)
  puts "最大切分乘積為 #{res}"
end
