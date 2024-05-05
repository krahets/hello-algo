/**
 * File: max_capacity.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Maximum capacity: Greedy */
int maxCapacity(List<int> ht) {
  // Initialize i, j, making them split the array at both ends
  int i = 0, j = ht.length - 1;
  // Initial maximum capacity is 0
  int res = 0;
  // Loop for greedy selection until the two boards meet
  while (i < j) {
    // Update maximum capacity
    int cap = min(ht[i], ht[j]) * (j - i);
    res = max(res, cap);
    // Move the shorter board inward
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

  // Greedy algorithm
  int res = maxCapacity(ht);
  print("Maximum capacity = $res");
}
