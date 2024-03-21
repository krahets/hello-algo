/**
 * File: iteration.dart
 * Created Time: 2023-08-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* for 迴圈 */
int forLoop(int n) {
  int res = 0;
  // 迴圈求和 1, 2, ..., n-1, n
  for (int i = 1; i <= n; i++) {
    res += i;
  }
  return res;
}

/* while 迴圈 */
int whileLoop(int n) {
  int res = 0;
  int i = 1; // 初始化條件變數
  // 迴圈求和 1, 2, ..., n-1, n
  while (i <= n) {
    res += i;
    i++; // 更新條件變數
  }
  return res;
}

/* while 迴圈（兩次更新） */
int whileLoopII(int n) {
  int res = 0;
  int i = 1; // 初始化條件變數
  // 迴圈求和 1, 4, 10, ...
  while (i <= n) {
    res += i;
    // 更新條件變數
    i++;
    i *= 2;
  }
  return res;
}

/* 雙層 for 迴圈 */
String nestedForLoop(int n) {
  String res = "";
  // 迴圈 i = 1, 2, ..., n-1, n
  for (int i = 1; i <= n; i++) {
    // 迴圈 j = 1, 2, ..., n-1, n
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
  print("\nfor 迴圈的求和結果 res = $res");

  res = whileLoop(n);
  print("\nwhile 迴圈的求和結果 res = $res");

  res = whileLoopII(n);
  print("\nwhile 迴圈（兩次更新）的求和結果 res = $res");

  String resStr = nestedForLoop(n);
  print("\n雙層 for 迴圈的結果 $resStr");
}
