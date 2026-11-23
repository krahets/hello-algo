=begin
File: insertion_sort.rb
Created Time: 2024-04-02
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 삽입 정렬 ###
def insertion_sort(nums)
  n = nums.length
  # 바깥쪽 반복문: 정렬된 구간은 [0, i-1]이다
  for i in 1...n
    base = nums[i]
    j = i - 1
    # 안쪽 반복문: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입한다
    while j >= 0 && nums[j] > base
      nums[j + 1] = nums[j] # nums[j]를 오른쪽으로 한 칸 이동한다
      j -= 1
    end
    nums[j + 1] = base # 올바른 위치에 base를 대입한다
  end
end

### 실행 코드 ###
nums = [4, 1, 3, 1, 5, 2]
insertion_sort(nums)
puts "삽입 정렬을 마친 후 nums = #{nums}"
