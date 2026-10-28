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
    // 버킷 100개를 포함하는 배열을 초기화한다
    _buckets = List.filled(100, null);
  }

  /* 해시 함수 */
  int _hashFunc(int key) {
    final int index = key % 100;
    return index;
  }

  /* 조회 연산 */
  String? get(int key) {
    final int index = _hashFunc(key);
    final Pair? pair = _buckets[index];
    if (pair == null) {
      return null;
    }
    return pair.val;
  }

  /* 추가 연산 */
  void put(int key, String val) {
    final Pair pair = Pair(key, val);
    final int index = _hashFunc(key);
    _buckets[index] = pair;
  }

  /* 삭제 연산 */
  void remove(int key) {
    final int index = _hashFunc(key);
    _buckets[index] = null;
  }

  /* 모든 키-값 쌍 반환 */
  List<Pair> pairSet() {
    List<Pair> pairSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        pairSet.add(pair);
      }
    }
    return pairSet;
  }

  /* 모든 키 반환 */
  List<int> keySet() {
    List<int> keySet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        keySet.add(pair.key);
      }
    }
    return keySet;
  }

  /* 모든 값 반환 */
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

/* 실행 코드 */
void main() {
  /* 해시 테이블 초기화 */
  final ArrayHashMap map = ArrayHashMap();

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
  String? name = map.get(15937);
  print("\n학번 15937을 입력하여 조회한 이름 = $name");

  /* 삭제 연산 */
  // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
  map.remove(10583);
  print("\n10583을 삭제한 후의 해시 테이블\n키 -> 값");
  map.printHashMap();

  /* 해시 테이블 순회 */
  print("\n키-값 쌍(키->값) 순회");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\n키 Key만 순회");
  map.keySet().forEach((key) => print("$key"));
  print("\n값 Value만 순회");
  map.values().forEach((val) => print("$val"));
}
