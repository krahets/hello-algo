/**
 * File: built_in_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../chapter_stack_and_queue/linkedlist_deque.dart';

/* Демонстрационный код */
void main() {
  int _num = 3;
  int hashNum = _num.hashCode;
  print("Целое число $_num имеет хеш $hashNum");

  bool bol = true;
  int hashBol = bol.hashCode;
  print("Логическое значение $bol имеет хеш $hashBol");

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("Вещественное число $dec имеет хеш $hashDec");

  String str = "Hello 算法";
  int hashStr = str.hashCode;
  print("Строка $str имеет хеш $hashStr");

  List arr = [12836, "小哈"];
  int hashArr = arr.hashCode;
  print("Массив $arr имеет хеш $hashArr");

  ListNode obj = new ListNode(0);
  int hashObj = obj.hashCode;
  print("Объект узла $obj имеет хеш $hashObj");
}
