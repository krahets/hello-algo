/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 실행 예제 */
void main() {
  /* 해시 테이블 초기화 */
  final Map<int, String> map = {};

  /* 추가 */
  // 해시 테이블에 키-값 쌍 (key, value) 추가
  map[12836] = "샤오하";
  map[15937] = "샤오뤄";
  map[16750] = "샤오쑤안";
  map[13276] = "샤오파";
  map[10583] = "샤오야";
  print("\n추가 후 해시 테이블\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* 조회 */
  // 해시 테이블에 키 key를 입력하여 값 value 조회
  final String? name = map[15937];
  print("\n학번 15937로 조회한 이름: $name");

  /* 삭제 */
  // 해시 테이블에서 키-값 쌍 (key, value) 삭제
  map.remove(10583);
  print("\n키 10583 삭제 후 해시 테이블\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* 해시 테이블 순회 */
  print("\n키-값 쌍 순회 Key->Value");
  map.forEach((key, value) => print("$key -> $value"));
  print("\n키만 순회 Key");
  map.keys.forEach((key) => print(key));
  print("\n값만 순회 Value");
  map.values.forEach((value) => print(value));
}
