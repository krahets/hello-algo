/**
 * File: preorder_traversal_iii_template.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 判斷當前狀態是否為解 */
bool isSolution(List<TreeNode> state) {
  return state.isNotEmpty && state.last.val == 7;
}

/* 記錄解 */
void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
  res.add(List.from(state));
}

/* 判斷在當前狀態下，該選擇是否合法 */
bool isValid(List<TreeNode> state, TreeNode? choice) {
  return choice != null && choice.val != 3;
}

/* 更新狀態 */
void makeChoice(List<TreeNode> state, TreeNode? choice) {
  state.add(choice!);
}

/* 恢復狀態 */
void undoChoice(List<TreeNode> state, TreeNode? choice) {
  state.removeLast();
}

/* 回溯演算法：例題三 */
void backtrack(
  List<TreeNode> state,
  List<TreeNode?> choices,
  List<List<TreeNode>> res,
) {
  // 檢查是否為解
  if (isSolution(state)) {
    // 記錄解
    recordSolution(state, res);
  }
  // 走訪所有選擇
  for (TreeNode? choice in choices) {
    // 剪枝：檢查選擇是否合法
    if (isValid(state, choice)) {
      // 嘗試：做出選擇，更新狀態
      makeChoice(state, choice);
      // 進行下一輪選擇
      backtrack(state, [choice!.left, choice.right], res);
      // 回退：撤銷選擇，恢復到之前的狀態
      undoChoice(state, choice);
    }
  }
}

/* Driver Code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n初始化二元樹");
  printTree(root);

  // 回溯演算法
  List<List<TreeNode>> res = [];
  backtrack([], [root!], res);
  print("\n輸出所有根節點到節點 7 的路徑，要求路徑中不包含值為 3 的節點");
  for (List<TreeNode> path in res) {
    print(List.from(path.map((e) => e.val)));
  }
}
