/**
 * File: preorder_traversal_iii_template.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 判断当前状态是否为解 */
bool isSolution(List<TreeNode> state) {
  return state.isNotEmpty && state.last.val == 7;
}

/* 记录解 */
void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
  res.add(List.from(state));
}

/* 判断在当前状态下，该选择是否合法 */
bool isValid(List<TreeNode> state, TreeNode? choice) {
  return choice != null && choice.val != 3;
}

/* 更新状态 */
void makeChoice(List<TreeNode> state, TreeNode? choice) {
  state.add(choice!);
}

/* 恢复状态 */
void undoChoice(List<TreeNode> state, TreeNode? choice) {
  state.removeLast();
}

/* 回溯算法：例题三 */
void backtrack(
  List<TreeNode> state,
  List<TreeNode?> choices,
  List<List<TreeNode>> res,
) {
  // 检查是否为解
  if (isSolution(state)) {
    // 记录解
    recordSolution(state, res);
  }
  // 遍历所有选择
  for (TreeNode? choice in choices) {
    // 剪枝：检查选择是否合法
    if (isValid(state, choice)) {
      // 尝试：做出选择，更新状态
      makeChoice(state, choice);
      // 进行下一轮选择
      backtrack(state, [choice!.left, choice.right], res);
      // 回退：撤销选择，恢复到之前的状态
      undoChoice(state, choice);
    }
  }
}

/* Driver Code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n初始化二叉树");
  printTree(root);

  // 回溯算法
  List<List<TreeNode>> res = [];
  backtrack([], [root!], res);
  print("\n输出所有根节点到节点 7 的路径，要求路径中不包含值为 3 的节点");
  for (List<TreeNode> path in res) {
    print(List.from(path.map((e) => e.val)));
  }
}
