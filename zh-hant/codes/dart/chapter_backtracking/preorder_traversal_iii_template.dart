/**
 * File: preorder_traversal_iii_template.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 判斷目前的狀態是否為解 */
bool isSolution(List<TreeNode> state) {
  return state.isNotEmpty && state.last.val == 7;
}

/* 記錄此解 */
void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
  res.add(List.from(state));
}

/* 判斷這個選擇在目前的狀態下是否合法 */
bool isValid(List<TreeNode> state, TreeNode? choice) {
  return choice != null && choice.val != 3;
}

/* 更新狀態 */
void makeChoice(List<TreeNode> state, TreeNode? choice) {
  state.add(choice!);
}

/* 還原狀態 */
void undoChoice(List<TreeNode> state, TreeNode? choice) {
  state.removeLast();
}

/* 回溯演算法：例題三 */
void backtrack(
  List<TreeNode> state,
  List<TreeNode?> choices,
  List<List<TreeNode>> res,
) {
  // 檢查目前的狀態是否為解
  if (isSolution(state)) {
    // 記錄此解
    recordSolution(state, res);
  }
  // 逐一檢查所有選項
  for (TreeNode? choice in choices) {
    // 剪枝：檢查選擇是否合法
    if (isValid(state, choice)) {
      // 嘗試：做出選擇並更新狀態
      makeChoice(state, choice);
      // 進入下一輪選擇
      backtrack(state, [choice!.left, choice.right], res);
      // 回溯：撤銷選擇，還原先前的狀態
      undoChoice(state, choice);
    }
  }
}

/* 主程式 */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n初始化二元樹");
  printTree(root);

  // 回溯演算法
  List<List<TreeNode>> res = [];
  backtrack([], [root!], res);
  print("\n輸出從根節點到值為 7 的節點的所有路徑，且路徑中不得包含值為 3 的節點");
  for (List<TreeNode> path in res) {
    print(List.from(path.map((e) => e.val)));
  }
}
