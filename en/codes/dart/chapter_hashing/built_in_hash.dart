/**
 * File: built_in_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Driver code */
void main() {
  // [region]{builtin_hash}
  int num = 3;
  int hashNum = num.hashCode;
  print("Integer $num has hash value $hashNum");
  // Integer 3 has hash value 34803

  bool bol = true;
  int hashBol = bol.hashCode;
  print("Boolean $bol has hash value $hashBol");
  // Boolean true has hash value 1231

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("Floating-point number $dec has hash value $hashDec");
  // Floating-point number 3.14159 has hash value 2570631074981783

  String str = "Hello 算法";
  int hashStr = str.hashCode;
  print("String '$str' has hash value $hashStr");
  // String 'Hello 算法' has hash value 468167534

  List arr = [12836, "小哈"];
  int hashArr = arr.hashCode;
  print("Array $arr has hash value $hashArr");
  // Array [12836, 小哈] has hash value 976512528

  ListNode obj = ListNode(0);
  int hashObj = obj.hashCode;
  print("Node object $obj has hash value $hashObj");
  // Node object Instance of 'ListNode' has hash value 1033450432
  // [endregion]{builtin_hash}
}
