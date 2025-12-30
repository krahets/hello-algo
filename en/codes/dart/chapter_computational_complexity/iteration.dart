/**
 * File: iteration.dart
 * Created Time: 2023-08-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* for loop */
int forLoop(int n) {
  int res = 0;
  // Sum 1, 2, ..., n-1, n
  for (int i = 1; i <= n; i++) {
    res += i;
  }
  return res;
}

/* while loop */
int whileLoop(int n) {
  int res = 0;
  int i = 1; // Initialize condition variable
  // Sum 1, 2, ..., n-1, n
  while (i <= n) {
    res += i;
    i++; // Update condition variable
  }
  return res;
}

/* while loop (two updates) */
int whileLoopII(int n) {
  int res = 0;
  int i = 1; // Initialize condition variable
  // Sum 1, 4, 10, ...
  while (i <= n) {
    res += i;
    // Update condition variable
    i++;
    i *= 2;
  }
  return res;
}

/* Nested for loop */
String nestedForLoop(int n) {
  String res = "";
  // Loop i = 1, 2, ..., n-1, n
  for (int i = 1; i <= n; i++) {
    // Loop j = 1, 2, ..., n-1, n
    for (int j = 1; j <= n; j++) {
      res += "($i, $j), ";
    }
  }
  return res;
}

/* Driver Code */
void main() {
  int n = 5;
  int res;

  res = forLoop(n);
  print("\nFor loop sum result res = $res");

  res = whileLoop(n);
  print("\nWhile loop sum result res = $res");

  res = whileLoopII(n);
  print("\nWhile loop (two updates) sum result res = $res");

  String resStr = nestedForLoop(n);
  print("\nNested for loop result $resStr");
}
