/**
 * File: built_in_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../chapter_stack_and_queue/linkedlist_deque.dart';

/* Driver code */
void main() {
  int _num = 3;
  int hashNum = _num.hashCode;
  print("Hash value of integer $_num: $hashNum");

  bool bol = true;
  int hashBol = bol.hashCode;
  print("Hash value of boolean $bol: $hashBol");

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("Floating-point number $dec has hash value $hashDec");

  String str = "Hello 算法";
  int hashStr = str.hashCode;
  print("Hash value of string $str: $hashStr");

  List arr = [12836, "小哈"];
  int hashArr = arr.hashCode;
  print("Array $arr has hash value $hashArr");

  ListNode obj = new ListNode(0);
  int hashObj = obj.hashCode;
  print("Node object $obj has hash value $hashObj");
}
