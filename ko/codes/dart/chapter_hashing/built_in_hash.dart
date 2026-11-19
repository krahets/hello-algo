/**
 * File: built_in_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 실행 코드 */
void main() {
  // [region]{builtin_hash}
  int num = 3;
  int hashNum = num.hashCode;
  print("정수 $num → 해시값: $hashNum");
  // 정수 3 → 해시값: 34803

  bool bol = true;
  int hashBol = bol.hashCode;
  print("불리언 값 $bol → 해시값: $hashBol");
  // 불리언 값 true → 해시값: 1231

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("소수 $dec → 해시값: $hashDec");
  // 소수 3.14159 → 해시값: 2570631074981783

  String str = "Hello 算法";
  int hashStr = str.hashCode;
  print("문자열 ‘$str’ → 해시값: $hashStr");
  // 문자열 ‘Hello 算法’ → 해시값: 468167534

  List arr = [12836, "小哈"];
  int hashArr = arr.hashCode;
  print("배열 $arr → 해시값: $hashArr");
  // 배열 [12836, 小哈] → 해시값: 976512528

  ListNode obj = ListNode(0);
  int hashObj = obj.hashCode;
  print("노드 객체 $obj → 해시값: $hashObj");
  // 노드 객체 Instance of 'ListNode' → 해시값: 1033450432
  // [endregion]{builtin_hash}
}
