/**
 * File: iteration.dart
 * Created Time: 2023-08-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* for ループ */
int forLoop(int n) {
  int res = 0;
  // 1, 2, ..., n-1, n の和をループで求める
  for (int i = 1; i <= n; i++) {
    res += i;
  }
  return res;
}

/* while ループ */
int whileLoop(int n) {
  int res = 0;
  int i = 1; // 条件判定用の変数を初期化
  // 1, 2, ..., n-1, n の和をループで求める
  while (i <= n) {
    res += i;
    i++; // 条件判定用の変数を更新
  }
  return res;
}

/* while ループ（2 回更新） */
int whileLoopII(int n) {
  int res = 0;
  int i = 1; // 条件判定用の変数を初期化
  // 1, 4, 10, ... の和をループで求める
  while (i <= n) {
    res += i;
    // 条件判定用の変数を更新
    i++;
    i *= 2;
  }
  return res;
}

/* 二重の for ループ */
String nestedForLoop(int n) {
  String res = "";
  // i = 1, 2, ..., n-1, n の順に繰り返す
  for (int i = 1; i <= n; i++) {
    // j = 1, 2, ..., n-1, n の順に繰り返す
    for (int j = 1; j <= n; j++) {
      res += "($i, $j), ";
    }
  }
  return res;
}

/* 実行例 */
void main() {
  int n = 5;
  int res;

  res = forLoop(n);
  print("\nfor ループによる総和 res = $res");

  res = whileLoop(n);
  print("\nwhile ループによる総和 res = $res");

  res = whileLoopII(n);
  print("\nwhile ループ（2 回更新）による総和 res = $res");

  String resStr = nestedForLoop(n);
  print("\n二重の for ループの結果 $resStr");
}
