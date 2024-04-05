/**
 * File: max_capacity.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 最大容量：貪婪 */
int maxCapacity(List<int> ht) {
  // 初始化 i, j，使其分列陣列兩端
  int i = 0, j = ht.length - 1;
  // 初始最大容量為 0
  int res = 0;
  // 迴圈貪婪選擇，直至兩板相遇
  while (i < j) {
    // 更新最大容量
    int cap = min(ht[i], ht[j]) * (j - i);
    res = max(res, cap);
    // 向內移動短板
    if (ht[i] < ht[j]) {
      i++;
    } else {
      j--;
    }
  }
  return res;
}

/* Driver Code */
void main() {
  List<int> ht = [3, 8, 5, 2, 7, 7, 3, 4];

  // 貪婪演算法
  int res = maxCapacity(ht);
  print("最大容量為 $res");
}
