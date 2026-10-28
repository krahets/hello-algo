=begin
File: bucket_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

### 버킷 정렬 ###
def bucket_sort(nums)
  # 버킷 k = n/2개를 초기화하며, 각 버킷에 원소 2개가 배정될 것으로 예상한다
  k = nums.length / 2
  buckets = Array.new(k) { [] }
  
  # 1. 배열 원소를 각 버킷에 배정한다
  nums.each do |num|
    # 입력 데이터의 범위는 [0, 1)이며, num * k를 사용하여 인덱스 범위 [0, k-1]에 대응시킨다
    i = (num * k).to_i
    # num을 버킷 i에 추가한다
    buckets[i] << num
  end

  # 2. 각 버킷을 정렬한다
  buckets.each do |bucket|
    # 내장 정렬 함수를 사용하며, 다른 정렬 알고리즘으로 대체할 수도 있다
    bucket.sort!
  end

  # 3. 버킷을 순회하여 결과를 합친다
  i = 0
  buckets.each do |bucket|
    bucket.each do |num|
      nums[i] = num
      i += 1
    end
  end
end

### 실행 코드 ###
if __FILE__ == $0
  # 입력 데이터는 범위가 [0, 1)인 부동 소수점 수라고 가정한다
  nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
  bucket_sort(nums)
  puts "버킷 정렬을 마친 후 nums = #{nums}"
end
