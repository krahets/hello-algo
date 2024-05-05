/**
 * File: built_in_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../chapter_stack_and_queue/linkedlist_deque.dart';

/* Driver Code */
void main() {
  int _num = 3;
  int hashNum = _num.hashCode;
  print("Hash value of integer $_num = $hashNum");

  bool bol = true;
  int hashBol = bol.hashCode;
  print("Hash value of boolean $bol = $hashBol");

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("Hash value of decimal $dec = $hashDec");

  String str = "Hello algorithm";
  int hashStr = str.hashCode;
  print("Hash value of string $str = $hashStr");

  List arr = [12836, "Ha"];
  int hashArr = arr.hashCode;
  print("Hash value of array $arr = $hashArr");

  ListNode obj = new ListNode(0);
  int hashObj = obj.hashCode;
  print("Hash value of node object $obj = $hashObj");
}
