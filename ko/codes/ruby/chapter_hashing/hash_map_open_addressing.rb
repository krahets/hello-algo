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
    @size = 0 # 키-값 쌍 개수
    @capacity = 4 # 해시 테이블 용량
    @load_thres = 2.0 / 3.0 # 용량 확장을 수행하는 적재율 임계값
    @extend_ratio = 2 # 용량 확장 배수
    @buckets = Array.new(@capacity) # 버킷 배열
  end

  ### 해시 함수 ###
  def hash_func(key)
    key % @capacity
  end

  ### 적재율 ###
  def load_factor
    @size / @capacity
  end

  ### key에 해당하는 버킷 인덱스 탐색 ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # 선형 탐사로 탐색하고, 빈 버킷을 만나면 반복문을 종료한다
    while !@buckets[index].nil?
      # key를 만나면 해당 버킷 인덱스를 반환한다
      if @buckets[index].key == key
        # 이전에 삭제 표시를 만났으면 키-값 쌍을 그 인덱스로 옮긴다
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # 옮긴 후의 버킷 인덱스를 반환한다
        end
        return index # 버킷 인덱스를 반환한다
      end
      # 처음 만난 삭제 표시를 기록한다
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # 버킷 인덱스를 계산하고, 끝을 넘어가면 처음으로 돌아온다
      index = (index + 1) % @capacity
    end
    # key가 없으면 추가할 위치의 인덱스를 반환한다
    first_tombstone == -1 ? index : first_tombstone
  end

  ### 조회 연산 ###
  def get(key)
    # key에 해당하는 버킷 인덱스 탐색
    index = find_bucket(key)
    # 키-값 쌍을 찾으면 해당 val을 반환한다
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # 키-값 쌍이 없으면 nil을 반환한다
    nil
  end

  ### 추가 연산 ###
  def put(key, val)
    # 적재율이 임계값을 초과하면 용량을 확장한다
    extend if load_factor > @load_thres
    # key에 해당하는 버킷 인덱스 탐색
    index = find_bucket(key)
    # 키-값 쌍을 찾으면 val을 덮어쓰고 반환한다
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # 키-값 쌍이 없으면 해당 키-값 쌍을 추가한다
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  ### 삭제 연산 ###
  def remove(key)
    # key에 해당하는 버킷 인덱스 탐색
    index = find_bucket(key)
    # 키-값 쌍을 찾으면 삭제 표시로 덮어쓴다
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  ### 해시 테이블 용량 확장 ###
  def extend
    # 원래 해시 테이블을 임시로 저장한다
    buckets_tmp = @buckets
    # 용량을 확장한 새 해시 테이블을 초기화한다
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
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

### 실행 코드 ###
if __FILE__ == $0
  # 해시 테이블 초기화
  hashmap = HashMapOpenAddressing.new

  # 추가 연산
  # 해시 테이블에 키-값 쌍 (key, val)을 추가한다
  hashmap.put(12836, "小哈")
  hashmap.put(15937, "小啰")
  hashmap.put(16750, "小算")
  hashmap.put(13276, "小法")
  hashmap.put(10583, "小鸭")
  puts "\n추가를 마친 후의 해시 테이블\n키 -> 값"
  hashmap.print

  # 조회 연산
  # 해시 테이블에 키 key를 입력하여 값 val을 얻는다
  name = hashmap.get(13276)
  puts "\n학번 13276을 입력하여 조회한 이름 #{name}"

  # 삭제 연산
  # 해시 테이블에서 키-값 쌍 (key, val)을 삭제한다
  hashmap.remove(16750)
  puts "\n16750을 삭제한 후의 해시 테이블\n키 -> 값"
  hashmap.print
end
