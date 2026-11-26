/**
 * File: array_hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 키-값 쌍 */
class Pair {
  int key;
  String val;
  Pair(this.key, this.val);
}

/* 배열로 구현한 해시 테이블 */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // 버킷 100개로 배열 초기화
    _buckets = List.filled(100, null);
  }

  /* 해시 함수 */
  int _hashFunc(int key) {
    final int index = key % 100;
    return index;
  }

  /* 조회 */
  String? get(int key) {
    final int index = _hashFunc(key);
    final Pair? pair = _buckets[index];
    if (pair == null) {
      return null;
    }
    return pair.val;
  }

  /* 추가 */
  void put(int key, String val) {
    final Pair pair = Pair(key, val);
    final int index = _hashFunc(key);
    _buckets[index] = pair;
  }

  /* 삭제 */
  void remove(int key) {
    final int index = _hashFunc(key);
    _buckets[index] = null;
  }

  /* 모든 키-값 쌍 가져오기 */
  List<Pair> pairSet() {
    List<Pair> pairSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        pairSet.add(pair);
      }
    }
    return pairSet;
  }

  /* 모든 키 가져오기 */
  List<int> keySet() {
    List<int> keySet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        keySet.add(pair.key);
      }
    }
    return keySet;
  }

  /* 모든 값 가져오기 */
  List<String> values() {
    List<String> valueSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        valueSet.add(pair.val);
      }
    }
    return valueSet;
  }

  /* 해시 테이블 출력 */
  void printHashMap() {
    for (final Pair kv in pairSet()) {
      print("${kv.key} -> ${kv.val}");
    }
  }
}

/* 실행 예제 */
void main() {
  /* 해시 테이블 초기화 */
  final ArrayHashMap map = ArrayHashMap();

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
  String? name = map.get(15937);
  print("\n학번 15937로 조회한 이름: $name");

  /* 삭제 */
  // 해시 테이블에서 키-값 쌍 (key, value) 삭제
  map.remove(10583);
  print("\n키 10583 삭제 후 해시 테이블\nKey -> Value");
  map.printHashMap();

  /* 해시 테이블 순회 */
  print("\n키-값 쌍 순회 Key->Value");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\n키만 순회 Key");
  map.keySet().forEach((key) => print("$key"));
  print("\n값만 순회 Value");
  map.values().forEach((val) => print("$val"));
}
