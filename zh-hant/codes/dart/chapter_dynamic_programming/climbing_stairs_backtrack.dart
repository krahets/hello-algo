/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 回溯 */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // 爬到第 n 階時，將走法數加 1
  if (state == n) {
    res[0]++;
  }
  // 走訪所有選項
  for (int choice in choices) {
    // 剪枝：不能越過第 n 階
    if (state + choice > n) continue;
    // 嘗試：做出選擇，更新狀態
    backtrack(choices, state + choice, n, res);
    // 撤銷選擇
  }
}

/* 爬樓梯：回溯法 */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // 每次可以往上爬 1 階或 2 階
  int state = 0; // 從第 0 階開始爬
  List<int> res = [];
  res.add(0); // 用 res[0] 記錄走法數
  backtrack(choices, state, n, res);
  return res[0];
}

/* 主程式 */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("爬 $n 階樓梯共有 $res 種走法");
}
