/**
 * File: complexity_exercises.dart
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

/* Sum using iteration */
int sumIter(int n) {
  int res = 0;
  for (int i = 1; i <= n; i++) {
    res += i;
  }
  return res;
}

/* Sum using recursion */
int sumRecur(int n) {
  if (n == 1) {
    return 1;
  }
  return n + sumRecur(n - 1);
}

/* Linear-time loop */
int linearLoop(int n) {
  int res = 0;
  for (int i = 0; i < n; i++) {
    res += i;
  }
  return res;
}

/* Quadratic-time loop */
int quadraticLoop(int n) {
  int res = 0;
  for (int i = 0; i < n; i++) {
    for (int j = i; j < n; j++) {
      res += j;
    }
  }
  return res;
}

/* Logarithmic-time loop */
int logarithmicLoop(int n) {
  while (n > 1) {
    n ~/= 2;
  }
  return n;
}

void main() {
  if (sumIter(1) != 1 ||
      sumRecur(1) != 1 ||
      sumIter(4) != 10 ||
      sumRecur(4) != 10 ||
      linearLoop(4) != 6 ||
      quadraticLoop(4) != 20 ||
      logarithmicLoop(4) != 1 ||
      logarithmicLoop(5) != 1) {
    throw StateError('Complexity exercise check failed');
  }
}
