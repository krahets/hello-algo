/**
 * File: hanota.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 円盤を 1 枚移す */
void move(List<int> src, List<int> tar) {
  // src の一番上から円盤を 1 枚取り出す
  int pan = src.removeLast();
  // 円盤を tar の一番上に置く
  tar.add(pan);
}

/* ハノイの塔の問題 f(i) を解く */
void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
  // src の円盤が残り 1 枚なら、そのまま tar に移す
  if (i == 1) {
    move(src, tar);
    return;
  }
  // 部分問題 f(i-1)：src の上から i-1 枚を tar を使って buf に移す
  dfs(i - 1, src, tar, buf);
  // 部分問題 f(1)：src に残った 1 枚を tar に移す
  move(src, tar);
  // 部分問題 f(i-1)：buf の上から i-1 枚を src を使って tar に移す
  dfs(i - 1, buf, src, tar);
}

/* ハノイの塔を解く */
void solveHanota(List<int> A, List<int> B, List<int> C) {
  int n = A.length;
  // A の上から n 枚の円盤を B を使って C に移す
  dfs(n, A, B, C);
}

/* 実行例 */
void main() {
  // リストの末尾が棒の一番上に対応する
  List<int> A = [5, 4, 3, 2, 1];
  List<int> B = [];
  List<int> C = [];
  print("初期状態：");
  print("A = $A");
  print("B = $B");
  print("C = $C");

  solveHanota(A, B, C);

  print("円盤をすべて移した後：");
  print("A = $A");
  print("B = $B");
  print("C = $C");
}
