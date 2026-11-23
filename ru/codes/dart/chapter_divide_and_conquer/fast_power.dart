/**
 * File: fast_power.dart
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

/* Быстрое возведение в степень */
int fastPow(int x, int n) {
  if (n == 0) {
    return 1;
  }
  int half = fastPow(x, n ~/ 2);
  if (n % 2 == 0) {
    return half * half;
  }
  return half * half * x;
}

void main() {
  if (fastPow(7, 0) != 1 || fastPow(3, 5) != 243 || fastPow(2, 6) != 64) {
    throw StateError('fast power check failed');
  }
}
