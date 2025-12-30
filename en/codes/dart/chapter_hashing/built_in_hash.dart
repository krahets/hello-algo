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
  print("Hash value of integer $_num is $hashNum");

  bool bol = true;
  int hashBol = bol.hashCode;
  print("Hash value of boolean $bol is $hashBol");

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("Hash value of decimal $dec is $hashDec");

  String str = "Hello Algo";
  int hashStr = str.hashCode;
  print("Hash value of string $str is $hashStr");

  List arr = [12836, "Xiao Ha"];
  int hashArr = arr.hashCode;
  print("Hash value of array $arr is $hashArr");

  ListNode obj = new ListNode(0);
  int hashObj = obj.hashCode;
  print("Hash value of node object $obj is $hashObj");
}
