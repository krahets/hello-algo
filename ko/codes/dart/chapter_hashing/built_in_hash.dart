/**
 * File: built_in_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../chapter_stack_and_queue/linkedlist_deque.dart';

/* 실행 코드 */
void main() {
  int _num = 3;
  int hashNum = _num.hashCode;
  print("정수 = $_num, 해시값 = $hashNum");

  bool bol = true;
  int hashBol = bol.hashCode;
  print("불리언 값 = $bol, 해시값 = $hashBol");

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("소수 = $dec, 해시값 = $hashDec");

  String str = "Hello 算法";
  int hashStr = str.hashCode;
  print("문자열 = $str, 해시값 = $hashStr");

  List arr = [12836, "小哈"];
  int hashArr = arr.hashCode;
  print("배열 = $arr, 해시값 = $hashArr");

  ListNode obj = new ListNode(0);
  int hashObj = obj.hashCode;
  print("노드 객체 = $obj, 해시값 = $hashObj");
}
