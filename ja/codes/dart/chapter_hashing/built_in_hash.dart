/**
 * File: built_in_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 実行用コード */
void main() {
  // [region]{builtin_hash}
  int num = 3;
  int hashNum = num.hashCode;
  print("整数 $num のハッシュ値は $hashNum");
  // 整数 3 のハッシュ値は 34803

  bool bol = true;
  int hashBol = bol.hashCode;
  print("真偽値 $bol のハッシュ値は $hashBol");
  // 真偽値 true のハッシュ値は 1231

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("小数 $dec のハッシュ値は $hashDec");
  // 小数 3.14159 のハッシュ値は 2570631074981783

  String str = "Hello 算法";
  int hashStr = str.hashCode;
  print("文字列「$str」のハッシュ値は $hashStr");
  // 文字列「Hello 算法」のハッシュ値は 468167534

  List arr = [12836, "小哈"];
  int hashArr = arr.hashCode;
  print("配列 $arr のハッシュ値は $hashArr");
  // 配列 [12836, 小哈] のハッシュ値は 976512528

  ListNode obj = ListNode(0);
  int hashObj = obj.hashCode;
  print("ノードオブジェクト $obj のハッシュ値は $hashObj");
  // ノードオブジェクト Instance of 'ListNode' のハッシュ値は 1033450432
  // [endregion]{builtin_hash}
}
