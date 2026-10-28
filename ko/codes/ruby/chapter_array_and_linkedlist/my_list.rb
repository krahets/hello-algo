=begin
File: my_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 리스트 클래스 ###
class MyList
  attr_reader :size       # 리스트 길이(현재 원소 개수) 반환
  attr_reader :capacity   # 리스트 용량 반환

  ### 생성자 ###
  def initialize
    @capacity = 10
    @size = 0
    @extend_ratio = 2
    @arr = Array.new(capacity)
  end

  ### 원소 접근 ###
  def get(index)
    # 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
    raise IndexError, "인덱스가 범위를 벗어났다" if index < 0 || index >= size
    @arr[index]
  end

  ### 원소 접근 ###
  def set(index, num)
    raise IndexError, "인덱스가 범위를 벗어났다" if index < 0 || index >= size
    @arr[index] = num
  end

  ### 맨 뒤에 원소 추가 ###
  def add(num)
    # 원소 개수가 용량을 초과하면 용량 확장을 수행한다
    extend_capacity if size == capacity
    @arr[size] = num

    # 원소 개수를 갱신한다
    @size += 1
  end

  ### 중간에 원소 삽입 ###
  def insert(index, num)
    raise IndexError, "인덱스가 범위를 벗어났다" if index < 0 || index >= size

    # 원소 개수가 용량을 초과하면 용량 확장을 수행한다
    extend_capacity if size == capacity

    # 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # 원소 개수를 갱신한다
    @size += 1
  end

  ### 원소 삭제 ###
  def remove(index)
    raise IndexError, "인덱스가 범위를 벗어났다" if index < 0 || index >= size
    num = @arr[index]

    # 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # 원소 개수를 갱신한다
    @size -= 1

    # 삭제한 원소를 반환한다
    num
  end

  ### 리스트 용량 확장 ###
  def extend_capacity
    # 길이가 원래 배열의 extend_ratio배인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # 리스트 용량을 갱신한다
    @capacity = arr.length
  end

  ### 리스트를 배열로 변환 ###
  def to_array
    sz = size
    # 유효한 길이 범위 안의 리스트 원소만 변환한다
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### 실행 코드 ###
if __FILE__ == $0
  # 리스트 초기화
  nums = MyList.new

  # 맨 뒤에 원소 추가
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "리스트 nums = #{nums.to_array}, 용량 = #{nums.capacity}, 길이 = #{nums.size}"

  # 중간에 원소 삽입
  nums.insert(3, 6)
  puts "인덱스 3에 숫자 6을 삽입한 후 nums = #{nums.to_array}"

  # 원소 삭제
  nums.remove(3)
  puts "인덱스 3의 원소를 삭제한 후 nums = #{nums.to_array}"

  # 원소 접근
  num = nums.get(1)
  puts "인덱스 1의 원소에 접근하여 얻은 num = #{num}"

  # 원소 갱신
  nums.set(1, 0)
  puts "인덱스 1의 원소를 0으로 갱신한 후 nums = #{nums.to_array}"

  # 용량 확장 동작 테스트
  for i in 0...10
    # i = 5일 때 리스트 길이가 용량을 초과하므로 용량 확장이 수행된다
    nums.add(i)
  end
  puts "용량을 확장한 후 리스트 nums = #{nums.to_array}, 용량 = #{nums.capacity}, 길이 = #{nums.size}"
end
