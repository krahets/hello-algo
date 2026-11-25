=begin
File: hash_map_open_addressing.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### 개방 주소법 해시 테이블 ###
class HashMapOpenAddressing
  TOMBSTONE = Pair.new(-1, '-1') # 삭제 표시

  ### 생성자 ###
  def initialize
    @size = 0 # 키-값 쌍의 개수
    @capacity = 4 # 해시 테이블의 용량
    @load_thres = 2.0 / 3.0 # 용량을 늘리는 기준이 되는 적재율
    @extend_ratio = 2 # 용량 증가 배수
    @buckets = Array.new(@capacity) # 버킷 배열
  end

  ### 해시 함수 ###
  def hash_func(key)
    key % @capacity
  end

  ### 적재율 ###
  def load_factor
    @size / @capacity.to_f
  end

  ### key에 해당하는 버킷 인덱스 찾기 ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # 선형 탐사 중 빈 버킷을 만나면 반복 종료
    while !@buckets[index].nil?
      # key를 만나면 해당 버킷 인덱스 반환
      if @buckets[index].key == key
        # 앞서 삭제 표시를 만났으면 키-값 쌍을 그 위치로 이동
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # 옮긴 뒤의 버킷 인덱스 반환
        end
        return index # 버킷 인덱스 반환
      end
      # 처음 만난 삭제 표시의 위치 기록
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # 다음 버킷 인덱스 계산. 끝을 지나면 처음으로 돌아감
      index = (index + 1) % @capacity
    end
    # key가 없으면 삽입할 위치의 인덱스 반환
    first_tombstone == -1 ? index : first_tombstone
  end

  ### 조회 ###
  def get(key)
    # key에 해당하는 버킷 인덱스 찾기
    index = find_bucket(key)
    # 키-값 쌍을 찾으면 해당 val 반환
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # 키-값 쌍이 없으면 nil 반환
    nil
  end

  ### 추가 ###
  def put(key, val)
    # 적재율이 임계값을 넘으면 용량 늘리기
    extend if load_factor > @load_thres
    # key에 해당하는 버킷 인덱스 찾기
    index = find_bucket(key)
    # 키-값 쌍을 찾으면 val을 덮어쓰고 반환
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # 키-값 쌍이 없으면 새로 추가
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  ### 삭제 ###
  def remove(key)
    # key에 해당하는 버킷 인덱스 찾기
    index = find_bucket(key)
    # 키-값 쌍을 찾으면 삭제 표시로 덮어쓰기
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  ### 해시 테이블 용량 늘리기 ###
  def extend
    # 기존 해시 테이블 임시 보관
    buckets_tmp = @buckets
    # 용량을 늘린 새 해시 테이블 초기화
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
    for pair in buckets_tmp
      put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
    end
  end

  ### 해시 테이블 출력 ###
  def print
    for pair in @buckets
      if pair.nil?
        puts "Nil"
      elsif pair == TOMBSTONE
        puts "TOMBSTONE"
      else
        puts "#{pair.key} -> #{pair.val}"
      end
    end
  end
end

### 실행 예제 ###
if __FILE__ == $0
  # 해시 테이블 초기화
  hashmap = HashMapOpenAddressing.new

  # 추가
  # 해시 테이블에 키-값 쌍 (key, val) 추가
  hashmap.put(12836, "샤오하")
  hashmap.put(15937, "샤오뤄")
  hashmap.put(16750, "샤오쑤안")
  hashmap.put(13276, "샤오파")
  hashmap.put(10583, "샤오야")
  puts "\n추가 후 해시 테이블\nKey -> Value"
  hashmap.print

  # 조회
  # 해시 테이블에 키 key를 입력하여 값 val 조회
  name = hashmap.get(13276)
  puts "\n학번 13276으로 조회한 이름: #{name}"

  # 삭제
  # 해시 테이블에서 키-값 쌍 (key, val) 삭제
  hashmap.remove(16750)
  puts "\n키 16750 삭제 후 해시 테이블\nKey -> Value"
  hashmap.print
end
