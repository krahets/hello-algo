/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
  late int _size; // 키-값 쌍 개수
  int _capacity = 4; // 해시 테이블 용량
  double _loadThres = 2.0 / 3.0; // 용량 확장을 수행하는 적재율 임계값
  int _extendRatio = 2; // 용량 확장 배수
  late List<Pair?> _buckets; // 버킷 배열
  Pair _TOMBSTONE = Pair(-1, "-1"); // 삭제 표시

  /* 생성자 */
  HashMapOpenAddressing() {
    _size = 0;
    _buckets = List.generate(_capacity, (index) => null);
  }

  /* 해시 함수 */
  int hashFunc(int key) {
    return key % _capacity;
  }

  /* 적재율 */
  double loadFactor() {
    return _size / _capacity;
  }

  /* key에 해당하는 버킷 인덱스 탐색 */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    // 선형 탐사로 탐색하고, 빈 버킷을 만나면 반복문을 종료한다
    while (_buckets[index] != null) {
      // key를 만나면 해당 버킷 인덱스를 반환한다
      if (_buckets[index]!.key == key) {
        // 이전에 삭제 표시를 만났으면 키-값 쌍을 그 인덱스로 옮긴다
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = _buckets[index];
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // 옮긴 후의 버킷 인덱스를 반환한다
        }
        return index; // 버킷 인덱스를 반환한다
      }
      // 처음 만난 삭제 표시를 기록한다
      if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
        firstTombstone = index;
      }
      // 버킷 인덱스를 계산하고, 끝을 넘어가면 처음으로 돌아온다
      index = (index + 1) % _capacity;
    }
    // key가 없으면 추가할 위치의 인덱스를 반환한다
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* 조회 연산 */
  String? get(int key) {
    // key에 해당하는 버킷 인덱스 탐색
    int index = findBucket(key);
    // 키-값 쌍을 찾으면 해당 val을 반환한다
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // 키-값 쌍이 없으면 null을 반환한다
    return null;
  }

  /* 추가 연산 */
  void put(int key, String val) {
    // 적재율이 임계값을 초과하면 용량을 확장한다
    if (loadFactor() > _loadThres) {
      extend();
    }
    // key에 해당하는 버킷 인덱스 탐색
    int index = findBucket(key);
    // 키-값 쌍을 찾으면 val을 덮어쓰고 반환한다
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // 키-값 쌍이 없으면 해당 키-값 쌍을 추가한다
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* 삭제 연산 */
  void remove(int key) {
    // key에 해당하는 버킷 인덱스 탐색
    int index = findBucket(key);
    // 키-값 쌍을 찾으면 삭제 표시로 덮어쓴다
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* 해시 테이블 용량 확장 */
  void extend() {
    // 원래 해시 테이블을 임시로 저장한다
    List<Pair?> bucketsTmp = _buckets;
    // 용량을 확장한 새 해시 테이블을 초기화한다
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
    for (Pair? pair in bucketsTmp) {
      if (pair != null && pair != _TOMBSTONE) {
        put(pair.key, pair.val);
      }
    }
  }

  /* 해시 테이블 출력 */
  void printHashMap() {
    for (Pair? pair in _buckets) {
      if (pair == null) {
        print("null");
      } else if (pair == _TOMBSTONE) {
        print("TOMBSTONE");
      } else {
        print("${pair.key} -> ${pair.val}");
      }
    }
  }
}

/* 실행 코드 */
void main() {
  /* 해시 테이블 초기화 */
  HashMapOpenAddressing map = HashMapOpenAddressing();

  /* 추가 연산 */
  // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
  map.put(12836, "小哈");
  map.put(15937, "小啰");
  map.put(16750, "小算");
  map.put(13276, "小法");
  map.put(10583, "小鸭");
  print("\n추가를 마친 후의 해시 테이블\n키 -> 값");
  map.printHashMap();

  /* 조회 연산 */
  // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
  String? name = map.get(13276);
  print("\n학번 13276을 입력하여 조회한 이름 = $name");

  /* 삭제 연산 */
  // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
  map.remove(16750);
  print("\n16750을 삭제한 후의 해시 테이블\n키 -> 값");
  map.printHashMap();
}
