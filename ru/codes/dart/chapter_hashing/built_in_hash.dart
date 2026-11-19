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
  print("Хеш-значение целого числа $num = $hashNum");
  // Хеш-значение целого числа 3 = 34803

  bool bol = true;
  int hashBol = bol.hashCode;
  print("Хеш-значение булева значения $bol = $hashBol");
  // Хеш-значение булева значения true = 1231

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("Хеш-значение десятичного числа $dec = $hashDec");
  // Хеш-значение десятичного числа 3.14159 = 2570631074981783

  String str = "Hello Algo";
  int hashStr = str.hashCode;
  print("Хеш-значение строки «$str» = $hashStr");
  // Хеш-значение строки «Hello Algo» = 335226759

  List arr = [12836, "Сяо Ха"];
  int hashArr = arr.hashCode;
  print("Хеш-значение массива $arr = $hashArr");
  // Хеш-значение массива [12836, Сяо Ха] = 976512528

  ListNode obj = ListNode(0);
  int hashObj = obj.hashCode;
  print("Хеш-значение объекта узла $obj = $hashObj");
  // Хеш-значение объекта узла Instance of 'ListNode' = 1033450432
  // [endregion]{builtin_hash}
}
