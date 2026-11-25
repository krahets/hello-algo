/**
 * File: max_product_cutting.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Greedy maximum product algorithm */
int maxProductCutting(int n) {
  // When n <= 3, one piece must be 1
  if (n <= 3) {
    return 1 * (n - 1);
  }
  // Greedily cut off pieces of size 3. Let a be their count and b the remainder
  int a = n ~/ 3;
  int b = n % 3;
  if (b == 1) {
    // If the remainder is 1, replace one pair 1 * 3 with 2 * 2
    return (pow(3, a - 1) * 2 * 2).toInt();
  }
  if (b == 2) {
    // If the remainder is 2, leave it as is
    return (pow(3, a) * 2).toInt();
  }
  // If the remainder is 0, no adjustment is needed
  return pow(3, a).toInt();
}

/* Driver code */
void main() {
  int n = 58;

  // Greedy algorithm
  int res = maxProductCutting(n);
  print("The maximum product after cutting is $res");
}
