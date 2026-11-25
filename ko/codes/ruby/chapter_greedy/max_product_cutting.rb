=begin
File: max_product_cutting.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 탐욕 알고리즘으로 정수 분할의 최대 곱 구하기 ###
def max_product_cutting(n)
  # n <= 3이면 반드시 1을 하나 떼어 낸다
  return 1 * (n - 1) if n <= 3
  # 탐욕적으로 3씩 떼어 낸다. a는 3의 개수이고 b는 나머지이다
  a, b = n / 3, n % 3
  # 나머지가 1이면 1 * 3 한 쌍을 2 * 2로 바꾼다
  return (3.pow(a - 1) * 2 * 2).to_i if b == 1
  # 나머지가 2이면 그대로 둔다
  return (3.pow(a) * 2).to_i if b == 2
  # 나머지가 0이면 그대로 둔다
  3.pow(a).to_i
end

### 실행 예제 ###
if __FILE__ == $0
  n = 58

  # 탐욕 알고리즘
  res = max_product_cutting(n)
  puts "분할한 수들의 최대 곱: #{res}"
end
