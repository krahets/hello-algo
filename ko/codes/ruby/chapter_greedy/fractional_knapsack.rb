=begin
File: fractional_knapsack.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 물건 ###
class Item
  attr_accessor :w # 물건의 무게
  attr_accessor :v # 물건의 가치

  def initialize(w, v)
    @w = w
    @v = v
  end
end

### 분할 가능한 배낭: 탐욕 ###
def fractional_knapsack(wgt, val, cap)
  # 무게와 가치 두 속성을 갖는 물건의 리스트를 생성한다
  items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
  # 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
  items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
  # 탐욕적 선택을 반복한다
  res = 0
  for item in items
    if item.w <= cap
      # 남은 용량이 충분하면 현재 물건을 통째로 배낭에 넣는다
      res += item.v
      cap -= item.w
    else
      # 남은 용량이 부족하면 현재 물건의 일부를 배낭에 넣는다
      res += (item.v.to_f / item.w) * cap
      # 남은 용량이 없으므로 반복문을 종료한다
      break
    end
  end
  res
end

### 실행 코드 ###
if __FILE__ == $0
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # 탐욕 알고리즘
  res = fractional_knapsack(wgt, val, cap)
  puts "배낭 용량을 초과하지 않는 물건의 최대 가치는 #{res}이다"
end
