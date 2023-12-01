/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 回溯 */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // 当爬到第 n 阶时，方案数量加 1
  if (state == n) {
    res[0]++;
  }
  // 遍历所有选择
  for (int choice in choices) {
    // 剪枝：不允许越过第 n 阶
    if (state + choice > n) continue;
    // 尝试：做出选择，更新状态
    backtrack(choices, state + choice, n, res);
    // 回退
  }
}

/* 爬楼梯：回溯 */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // 可选择向上爬 1 阶或 2 阶
  int state = 0; // 从第 0 阶开始爬
  List<int> res = [];
  res.add(0); // 使用 res[0] 记录方案数量
  backtrack(choices, state, n, res);
  return res[0];
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("爬 $n 阶楼梯共有 $res 种方案");
}
