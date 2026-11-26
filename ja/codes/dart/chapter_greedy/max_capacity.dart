/**
 * File: max_capacity.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 最大容量（貪欲法） */
int maxCapacity(List<int> ht) {
  // i と j を配列の両端に置く
  int i = 0, j = ht.length - 1;
  // 最大容量の初期値は 0
  int res = 0;
  // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
  while (i < j) {
    // 最大容量を更新する
    int cap = min(ht[i], ht[j]) * (j - i);
    res = max(res, cap);
    // 低い板のポインタを内側へ動かす
    if (ht[i] < ht[j]) {
      i++;
    } else {
      j--;
    }
  }
  return res;
}

/* 実行例 */
void main() {
  List<int> ht = [3, 8, 5, 2, 7, 7, 3, 4];

  // 貪欲法
  int res = maxCapacity(ht);
  print("最大容量は $res");
}
