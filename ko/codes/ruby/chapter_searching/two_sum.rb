=begin
File: two_sum.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 방법 1. 모든 조합 확인 ###
def two_sum_brute_force(nums, target)
  # 이중 반복문을 사용하므로 시간 복잡도는 O(n^2)이다.
  for i in 0...(nums.length - 1)
    for j in (i + 1)...nums.length
      return [i, j] if nums[i] + nums[j] == target
    end
  end

  []
end

### 방법 2. 보조 해시 테이블 사용 ###
def two_sum_hash_table(nums, target)
  # 보조 해시 테이블을 사용하므로 공간 복잡도는 O(n)이다.
  dic = {}
  # 반복문 하나만 사용하므로 시간 복잡도는 O(n)이다.
  for i in 0...nums.length
    return [dic[target - nums[i]], i] if dic.has_key?(target - nums[i])

    dic[nums[i]] = i
  end

  []
end

### 실행 예제 ###
if __FILE__ == $0
  # ======= 테스트 케이스 =======
  nums = [2, 7, 11, 15]
  target = 13

  # ====== 실행 예제 ======
  # 방법 1
  res = two_sum_brute_force(nums, target)
  puts "방법 1 res = #{res}"
  # 방법 2
  res = two_sum_hash_table(nums, target)
  puts "방법 2 res = #{res}"
end
