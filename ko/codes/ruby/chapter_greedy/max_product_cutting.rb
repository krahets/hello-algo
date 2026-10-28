=begin
File: max_product_cutting.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 분할 후의 최대 곱: 탐욕 ###
def max_product_cutting(n)
  # n <= 3이면 반드시 1 하나가 나오도록 분할해야 한다
  return 1 * (n - 1) if n <= 3
  # 탐욕적으로 3을 떼어 낸다. a는 3의 개수이고 b는 나머지이다
  a, b = n / 3, n % 3
  # 나머지가 1이면 1 * 3 한 쌍을 2 * 2로 바꾼다
  return (3.pow(a - 1) * 2 * 2).to_i if b == 1
  # 나머지가 2이면 별도로 처리하지 않는다
  return (3.pow(a) * 2).to_i if b == 2
  # 나머지가 0이면 별도로 처리하지 않는다
  3.pow(a).to_i
end

### 실행 코드 ###
if __FILE__ == $0
  n = 58

  # 탐욕 알고리즘
  res = max_product_cutting(n)
  puts "나눈 조각 길이의 최대 곱은 #{res}이다"
end
