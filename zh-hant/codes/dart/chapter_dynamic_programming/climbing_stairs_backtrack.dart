/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 回溯 */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // 當爬到第 n 階時，方案數量加 1
  if (state == n) {
    res[0]++;
  }
  // 走訪所有選擇
  for (int choice in choices) {
    // 剪枝：不允許越過第 n 階
    if (state + choice > n) continue;
    // 嘗試：做出選擇，更新狀態
    backtrack(choices, state + choice, n, res);
    // 回退
  }
}

/* 爬樓梯：回溯 */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // 可選擇向上爬 1 階或 2 階
  int state = 0; // 從第 0 階開始爬
  List<int> res = [];
  res.add(0); // 使用 res[0] 記錄方案數量
  backtrack(choices, state, n, res);
  return res[0];
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("爬 $n 階樓梯共有 $res 種方案");
}
