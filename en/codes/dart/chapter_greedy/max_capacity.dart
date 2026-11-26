/**
 * File: max_capacity.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Greedy maximum capacity algorithm */
int maxCapacity(List<int> ht) {
  // Start i and j at opposite ends of the array
  int i = 0, j = ht.length - 1;
  // The initial maximum capacity is 0
  int res = 0;
  // Make greedy choices until the two pointers meet
  while (i < j) {
    // Update the maximum capacity
    int cap = min(ht[i], ht[j]) * (j - i);
    res = max(res, cap);
    // Move the pointer at the shorter board inward
    if (ht[i] < ht[j]) {
      i++;
    } else {
      j--;
    }
  }
  return res;
}

/* Driver code */
void main() {
  List<int> ht = [3, 8, 5, 2, 7, 7, 3, 4];

  // Greedy algorithm
  int res = maxCapacity(ht);
  print("The maximum capacity is $res");
}
