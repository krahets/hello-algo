/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
  late int _size; // 키-값 쌍의 개수
  int _capacity = 4; // 해시 테이블의 용량
  double _loadThres = 2.0 / 3.0; // 용량을 늘리는 기준이 되는 적재율
  int _extendRatio = 2; // 용량 증가 배수
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

  /* key에 해당하는 버킷 인덱스 찾기 */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    for (int i = 0; i < _capacity; i++) {
      final bucket = _buckets[index];
      if (bucket == null) break;
      // 처음 만난 삭제 표시의 위치 기록
      if (identical(bucket, _TOMBSTONE)) {
        if (firstTombstone == -1) firstTombstone = index;
      } else if (bucket.key == key) {
        // 앞서 삭제 표시를 만났으면 키-값 쌍을 그 위치로 이동
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = bucket;
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // 옮긴 뒤의 버킷 인덱스 반환
        }
        return index; // 버킷 인덱스 반환
      }
      // 다음 버킷 인덱스 계산. 끝을 지나면 처음으로 돌아감
      index = (index + 1) % _capacity;
    }
    // key가 없으면 삽입할 위치의 인덱스 반환
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* 조회 */
  String? get(int key) {
    // key에 해당하는 버킷 인덱스 찾기
    int index = findBucket(key);
    // 키-값 쌍을 찾으면 해당 val 반환
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // 키-값 쌍이 없으면 null 반환
    return null;
  }

  /* 추가 */
  void put(int key, String val) {
    // 적재율이 임계값을 넘으면 용량 늘리기
    if (loadFactor() > _loadThres) {
      extend();
    }
    // key에 해당하는 버킷 인덱스 찾기
    int index = findBucket(key);
    // 키-값 쌍을 찾으면 val을 덮어쓰고 반환
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // 키-값 쌍이 없으면 새로 추가
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* 삭제 */
  void remove(int key) {
    // key에 해당하는 버킷 인덱스 찾기
    int index = findBucket(key);
    // 키-값 쌍을 찾으면 삭제 표시로 덮어쓰기
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* 해시 테이블 용량 늘리기 */
  void extend() {
    // 기존 해시 테이블 임시 보관
    List<Pair?> bucketsTmp = _buckets;
    // 용량을 늘린 새 해시 테이블 초기화
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
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

/* 실행 예제 */
void main() {
  /* 해시 테이블 초기화 */
  HashMapOpenAddressing map = HashMapOpenAddressing();

  /* 추가 */
  // 해시 테이블에 키-값 쌍 (key, value) 추가
  map.put(12836, "샤오하");
  map.put(15937, "샤오뤄");
  map.put(16750, "샤오쑤안");
  map.put(13276, "샤오파");
  map.put(10583, "샤오야");
  print("\n추가 후 해시 테이블\nKey -> Value");
  map.printHashMap();

  /* 조회 */
  // 해시 테이블에 키 key를 입력하여 값 value 조회
  String? name = map.get(13276);
  print("\n학번 13276으로 조회한 이름: $name");

  /* 삭제 */
  // 해시 테이블에서 키-값 쌍 (key, value) 삭제
  map.remove(16750);
  print("\n키 16750 삭제 후 해시 테이블\nKey -> Value");
  map.printHashMap();
}
