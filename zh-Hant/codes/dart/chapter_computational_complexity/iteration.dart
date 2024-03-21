/**
 * File: iteration.dart
 * Created Time: 2023-08-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* for 循环 */
int forLoop(int n) {
  int res = 0;
  // 循环求和 1, 2, ..., n-1, n
  for (int i = 1; i <= n; i++) {
    res += i;
  }
  return res;
}

/* while 循环 */
int whileLoop(int n) {
  int res = 0;
  int i = 1; // 初始化条件变量
  // 循环求和 1, 2, ..., n-1, n
  while (i <= n) {
    res += i;
    i++; // 更新条件变量
  }
  return res;
}

/* while 循环（两次更新） */
int whileLoopII(int n) {
  int res = 0;
  int i = 1; // 初始化条件变量
  // 循环求和 1, 4, 10, ...
  while (i <= n) {
    res += i;
    // 更新条件变量
    i++;
    i *= 2;
  }
  return res;
}

/* 双层 for 循环 */
String nestedForLoop(int n) {
  String res = "";
  // 循环 i = 1, 2, ..., n-1, n
  for (int i = 1; i <= n; i++) {
    // 循环 j = 1, 2, ..., n-1, n
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
  print("\nfor 循环的求和结果 res = $res");

  res = whileLoop(n);
  print("\nwhile 循环的求和结果 res = $res");

  res = whileLoopII(n);
  print("\nwhile 循环（两次更新）的求和结果 res = $res");

  String resStr = nestedForLoop(n);
  print("\n双层 for 循环的结果 $resStr");
}
