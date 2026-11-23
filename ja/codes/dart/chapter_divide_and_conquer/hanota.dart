/**
 * File: hanota.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 円盤を 1 枚移動する */
void move(List<int> src, List<int> tar) {
  // src の一番上から円盤を 1 枚取り出す
  int pan = src.removeLast();
  // tar の一番上に円盤を置く
  tar.add(pan);
}

/* ハノイの塔の問題 f(i) を解く */
void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
  // src に円盤が 1 枚だけ残っている場合、そのまま tar に移す
  if (i == 1) {
    move(src, tar);
    return;
  }
  // 部分問題 f(i-1) ：src の上から i-1 枚の円盤を、tar を使って buf に移す
  dfs(i - 1, src, tar, buf);
  // 部分問題 f(1) ：src に残った 1 枚の円盤を tar に移す
  move(src, tar);
  // 部分問題 f(i-1) ：buf の上から i-1 枚の円盤を、src を使って tar に移す
  dfs(i - 1, buf, src, tar);
}

/* ハノイの塔の問題を解く */
void solveHanota(List<int> A, List<int> B, List<int> C) {
  int n = A.length;
  // A の上から n 枚の円盤を、B を使って C に移す
  dfs(n, A, B, C);
}

/* 実行用コード */
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

  print("円盤の移動完了後：");
  print("A = $A");
  print("B = $B");
  print("C = $C");
}
