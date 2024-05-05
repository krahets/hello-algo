/**
 * File: iteration.dart
 * Created Time: 2023-08-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* for loop */
int forLoop(int n) {
  int res = 0;
  // Loop sum 1, 2, ..., n-1, n
  for (int i = 1; i <= n; i++) {
    res += i;
  }
  return res;
}

/* while loop */
int whileLoop(int n) {
  int res = 0;
  int i = 1; // Initialize condition variable
  // Loop sum 1, 2, ..., n-1, n
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
  // Loop sum 1, 4, 10, ...
  while (i <= n) {
    res += i;
    // Update condition variable
    i++;
    i *= 2;
  }
  return res;
}

/* Double for loop */
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
  print("\nSum result of for loop res = $res");

  res = whileLoop(n);
  print("\nSum result of while loop res = $res");

  res = whileLoopII(n);
  print("\nSum result of while loop (two updates) res = $res");

  String resStr = nestedForLoop(n);
  print("\nResult of double for loop $resStr");
}
