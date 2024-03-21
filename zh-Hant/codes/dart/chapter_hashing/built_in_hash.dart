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
  print("整數 $_num 的雜湊值為 $hashNum");

  bool bol = true;
  int hashBol = bol.hashCode;
  print("布林值 $bol 的雜湊值為 $hashBol");

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("小數 $dec 的雜湊值為 $hashDec");

  String str = "Hello 演算法";
  int hashStr = str.hashCode;
  print("字串 $str 的雜湊值為 $hashStr");

  List arr = [12836, "小哈"];
  int hashArr = arr.hashCode;
  print("陣列 $arr 的雜湊值為 $hashArr");

  ListNode obj = new ListNode(0);
  int hashObj = obj.hashCode;
  print("節點物件 $obj 的雜湊值為 $hashObj");
}
