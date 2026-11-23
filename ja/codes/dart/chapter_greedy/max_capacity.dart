/**
 * File: max_capacity.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 最大容量：貪欲法 */
int maxCapacity(List<int> ht) {
  // i, j を初期化し、配列の両端をそれぞれ指すようにする
  int i = 0, j = ht.length - 1;
  // 最大容量の初期値は 0
  int res = 0;
  // 2 枚の板が出会うまで貪欲な選択を繰り返す
  while (i < j) {
    // 最大容量を更新する
    int cap = min(ht[i], ht[j]) * (j - i);
    res = max(res, cap);
    // 低い方の仕切り板を内側に移動する
    if (ht[i] < ht[j]) {
      i++;
    } else {
      j--;
    }
  }
  return res;
}

/* 実行用コード */
void main() {
  List<int> ht = [3, 8, 5, 2, 7, 7, 3, 4];

  // 貪欲アルゴリズム
  int res = maxCapacity(ht);
  print("最大容量は $res");
}
