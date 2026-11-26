=begin
File: max_capacity.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 탐욕 알고리즘으로 최대 용량 구하기 ###
def max_capacity(ht)
  # i와 j를 각각 배열의 양 끝에 놓는다
  i, j = 0, ht.length - 1
  # 최대 용량의 초깃값은 0이다
  res = 0

  # 두 칸막이가 만날 때까지 탐욕 선택을 반복한다
  while i < j
    # 최대 용량을 갱신한다
    cap = [ht[i], ht[j]].min * (j - i)
    res = [res, cap].max
    # 낮은 칸막이 쪽을 안으로 한 칸 옮긴다
    if ht[i] < ht[j]
      i += 1
    else
      j -= 1
    end
  end

  res
end

### 실행 예제 ###
if __FILE__ == $0
  ht = [3, 8, 5, 2, 7, 7, 3, 4]

  # 탐욕 알고리즘
  res = max_capacity(ht)
  puts "최대 용량: #{res}"
end
