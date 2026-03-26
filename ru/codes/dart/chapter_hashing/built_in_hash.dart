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
  print("Хеш-значение целого числа $_num равно $hashNum");

  bool bol = true;
  int hashBol = bol.hashCode;
  print("Хеш-значение логического значения $bol равно $hashBol");

  double dec = 3.14159;
  int hashDec = dec.hashCode;
  print("Хеш-значение десятичного числа $dec равно $hashDec");

  String str = "Hello Algo";
  int hashStr = str.hashCode;
  print("Хеш-значение строки $str равно $hashStr");

  List arr = [12836, "Сяо Ха"];
  int hashArr = arr.hashCode;
  print("массив $arr равно $hashArr");

  ListNode obj = new ListNode(0);
  int hashObj = obj.hashCode;
  print("объект узла $obj равно $hashObj");
}
