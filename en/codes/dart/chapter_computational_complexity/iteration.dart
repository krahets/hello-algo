/**
 * File: iteration.dart
 * Created Time: 2023-08-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* for loop */
int forLoop(int n) {
  int res = 0;
  // Sum 1, 2, ..., n-1, n in a loop
  for (int i = 1; i <= n; i++) {
    res += i;
  }
  return res;
}

/* while loop */
int whileLoop(int n) {
  int res = 0;
  int i = 1; // Initialize the loop control variable
  // Sum 1, 2, ..., n-1, n in a loop
  while (i <= n) {
    res += i;
    i++; // Update the loop control variable
  }
  return res;
}

/* while loop (two updates) */
int whileLoopII(int n) {
  int res = 0;
  int i = 1; // Initialize the loop control variable
  // Sum 1, 4, 10, ... in a loop
  while (i <= n) {
    res += i;
    // Update the loop control variable
    i++;
    i *= 2;
  }
  return res;
}

/* Nested for loops */
String nestedForLoop(int n) {
  String res = "";
  // Loop over i = 1, 2, ..., n-1, n
  for (int i = 1; i <= n; i++) {
    // Loop over j = 1, 2, ..., n-1, n
    for (int j = 1; j <= n; j++) {
      res += "($i, $j), ";
    }
  }
  return res;
}

/* Driver code */
void main() {
  int n = 5;
  int res;

  res = forLoop(n);
  print("\nSum from the for loop: res = $res");

  res = whileLoop(n);
  print("\nSum from the while loop: res = $res");

  res = whileLoopII(n);
  print("\nSum from the while loop (two updates): res = $res");

  String resStr = nestedForLoop(n);
  print("\nResult of the nested for loops: $resStr");
}
