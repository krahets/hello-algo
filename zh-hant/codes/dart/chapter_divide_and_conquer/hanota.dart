/**
 * File: hanota.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 移動一個圓盤 */
void move(List<int> src, List<int> tar) {
  // 從 src 頂端取出一個圓盤
  int pan = src.removeLast();
  // 將圓盤放到 tar 頂端
  tar.add(pan);
}

/* 求解河內塔問題 f(i) */
void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
  // 若 src 只剩一個圓盤，直接將它移到 tar
  if (i == 1) {
    move(src, tar);
    return;
  }
  // 子問題 f(i-1)：藉助 tar，將 src 頂端的 i-1 個圓盤移到 buf
  dfs(i - 1, src, tar, buf);
  // 子問題 f(1)：將 src 剩下的一個圓盤移到 tar
  move(src, tar);
  // 子問題 f(i-1)：藉助 src，將 buf 頂端的 i-1 個圓盤移到 tar
  dfs(i - 1, buf, src, tar);
}

/* 求解河內塔問題 */
void solveHanota(List<int> A, List<int> B, List<int> C) {
  int n = A.length;
  // 藉助 B，將 A 頂端的 n 個圓盤移到 C
  dfs(n, A, B, C);
}

/* 主程式 */
void main() {
  // 串列尾端對應柱子頂端
  List<int> A = [5, 4, 3, 2, 1];
  List<int> B = [];
  List<int> C = [];
  print("初始狀態：");
  print("A = $A");
  print("B = $B");
  print("C = $C");

  solveHanota(A, B, C);

  print("圓盤移動完成後：");
  print("A = $A");
  print("B = $B");
  print("C = $C");
}
