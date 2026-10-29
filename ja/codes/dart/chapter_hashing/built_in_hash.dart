/**
 * File: built_in_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../chapter_stack_and_queue/linkedlist_deque.dart';

/* 実行用コード */
void main() {
  int _num = 3;
  int hashNum = _num.hashCode;
  print("整数 $_num のハッシュ値は $hashNum");

  bool bol = true;
  int hashBol = bol.hashCode;
  print("真偽値 $bol のハッシュ値は $hashBol");

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("小数 $dec のハッシュ値は $hashDec");

  String str = "Hello 算法";
  int hashStr = str.hashCode;
  print("文字列 $str のハッシュ値は $hashStr");

  List arr = [12836, "小哈"];
  int hashArr = arr.hashCode;
  print("配列 $arr のハッシュ値は $hashArr");

  ListNode obj = new ListNode(0);
  int hashObj = obj.hashCode;
  print("ノードオブジェクト $obj のハッシュ値は $hashObj");
}
