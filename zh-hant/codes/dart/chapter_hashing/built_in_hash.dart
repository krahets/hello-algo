/**
 * File: built_in_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Driver Code */
void main() {
  // [region]{builtin_hash}
  int num = 3;
  int hashNum = num.hashCode;
  print("整數 $num 的雜湊值為 $hashNum");
  // 整數 3 的雜湊值為 34803

  bool bol = true;
  int hashBol = bol.hashCode;
  print("布林量 $bol 的雜湊值為 $hashBol");
  // 布林量 true 的雜湊值為 1231

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("小數 $dec 的雜湊值為 $hashDec");
  // 小數 3.14159 的雜湊值為 2570631074981783

  String str = "Hello 演算法";
  int hashStr = str.hashCode;
  print("字串“$str”的雜湊值為 $hashStr");
  // 字串“Hello 演算法”的雜湊值為 468167534

  List arr = [12836, "小哈"];
  int hashArr = arr.hashCode;
  print("陣列 $arr 的雜湊值為 $hashArr");
  // 陣列 [12836, 小哈] 的雜湊值為 976512528

  ListNode obj = ListNode(0);
  int hashObj = obj.hashCode;
  print("節點物件 $obj 的雜湊值為 $hashObj");
  // 節點物件 Instance of 'ListNode' 的雜湊值為 1033450432
  // [endregion]{builtin_hash}
}
