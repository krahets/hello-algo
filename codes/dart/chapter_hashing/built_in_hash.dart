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
  print("整数 $_num 的哈希值为 $hashNum");

  bool bol = true;
  int hashBol = bol.hashCode;
  print("布尔值 $bol 的哈希值为 $hashBol");

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("小数 $dec 的哈希值为 $hashDec");

  String str = "Hello 算法";
  int hashStr = str.hashCode;
  print("字符串 $str 的哈希值为 $hashStr");

  List arr = [12836, "小哈"];
  int hashArr = arr.hashCode;
  print("数组 $arr 的哈希值为 $hashArr");

  ListNode obj = new ListNode(0);
  int hashObj = obj.hashCode;
  print("节点对象 $obj 的哈希值为 $hashObj");
}
