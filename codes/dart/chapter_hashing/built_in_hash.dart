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
  print("整数 $num 的哈希值为 $hashNum");
  // 整数 3 的哈希值为 34803

  bool bol = true;
  int hashBol = bol.hashCode;
  print("布尔量 $bol 的哈希值为 $hashBol");
  // 布尔量 true 的哈希值为 1231

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("小数 $dec 的哈希值为 $hashDec");
  // 小数 3.14159 的哈希值为 2570631074981783

  String str = "Hello 算法";
  int hashStr = str.hashCode;
  print("字符串“$str”的哈希值为 $hashStr");
  // 字符串“Hello 算法”的哈希值为 468167534

  List arr = [12836, "小哈"];
  int hashArr = arr.hashCode;
  print("数组 $arr 的哈希值为 $hashArr");
  // 数组 [12836, 小哈] 的哈希值为 976512528

  ListNode obj = ListNode(0);
  int hashObj = obj.hashCode;
  print("节点对象 $obj 的哈希值为 $hashObj");
  // 节点对象 Instance of 'ListNode' 的哈希值为 1033450432
  // [endregion]{builtin_hash}
}
