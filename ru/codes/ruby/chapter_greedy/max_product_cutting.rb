=begin
File: max_product_cutting.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Максимальное произведение разбиения: жадный алгоритм ###
def max_product_cutting(n)
  # Когда n <= 3, необходимо отделить одну 1
  return 1 * (n - 1) if n <= 3
  # Жадно выделить части по 3, где a — число троек, а b — остаток
  a, b = n / 3, n % 3
  # Когда остаток равен 1, преобразовать пару 1 * 3 в 2 * 2
  return (3.pow(a - 1) * 2 * 2).to_i if b == 1
  # Когда остаток равен 2, ничего делать не нужно
  return (3.pow(a) * 2).to_i if b == 2
  # Когда остаток равен 0, ничего делать не нужно
  3.pow(a).to_i
end

### Driver Code ###
if __FILE__ == $0
  n = 58

  # Жадный алгоритм
  res = max_product_cutting(n)
  puts "максимальное произведение разбиенияравно #{res}"
end
