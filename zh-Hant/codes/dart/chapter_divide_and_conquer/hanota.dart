/**
 * File: hanota.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 移动一个圆盘 */
void move(List<int> src, List<int> tar) {
  // 从 src 顶部拿出一个圆盘
  int pan = src.removeLast();
  // 将圆盘放入 tar 顶部
  tar.add(pan);
}

/* 求解汉诺塔问题 f(i) */
void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
  // 若 src 只剩下一个圆盘，则直接将其移到 tar
  if (i == 1) {
    move(src, tar);
    return;
  }
  // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
  dfs(i - 1, src, tar, buf);
  // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
  move(src, tar);
  // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
  dfs(i - 1, buf, src, tar);
}

/* 求解汉诺塔问题 */
void solveHanota(List<int> A, List<int> B, List<int> C) {
  int n = A.length;
  // 将 A 顶部 n 个圆盘借助 B 移到 C
  dfs(n, A, B, C);
}

/* Driver Code */
void main() {
  // 列表尾部是柱子顶部
  List<int> A = [5, 4, 3, 2, 1];
  List<int> B = [];
  List<int> C = [];
  print("初始状态下：");
  print("A = $A");
  print("B = $B");
  print("C = $C");

  solveHanota(A, B, C);

  print("圆盘移动完成后：");
  print("A = $A");
  print("B = $B");
  print("C = $C");
}
