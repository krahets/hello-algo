/**
 * File: preorder_traversal_iii_template.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 現在の状態が解かどうかを判定 */
bool isSolution(List<TreeNode> state) {
  return state.isNotEmpty && state.last.val == 7;
}

/* 解を記録 */
void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
  res.add(List.from(state));
}

/* 現在の状態で、この選択が有効かどうかを判定 */
bool isValid(List<TreeNode> state, TreeNode? choice) {
  return choice != null && choice.val != 3;
}

/* 状態を更新 */
void makeChoice(List<TreeNode> state, TreeNode? choice) {
  state.add(choice!);
}

/* 状態を元に戻す */
void undoChoice(List<TreeNode> state, TreeNode? choice) {
  state.removeLast();
}

/* バックトラッキング：例題 3 */
void backtrack(
  List<TreeNode> state,
  List<TreeNode?> choices,
  List<List<TreeNode>> res,
) {
  // 解かどうかを確認
  if (isSolution(state)) {
    // 解を記録
    recordSolution(state, res);
  }
  // すべての選択肢を走査
  for (TreeNode? choice in choices) {
    // 枝刈り：選択が妥当かを確認する
    if (isValid(state, choice)) {
      // 試行: 選択を行い、状態を更新
      makeChoice(state, choice);
      // 次の選択へ進む
      backtrack(state, [choice!.left, choice.right], res);
      // バックトラック：選択を取り消し、前の状態に戻す
      undoChoice(state, choice);
    }
  }
}

/* Driver Code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n二分木を初期化");
  printTree(root);

  // バックトラッキング法
  List<List<TreeNode>> res = [];
  backtrack([], [root!], res);
  print("\nルートノードからノード 7 までのすべての経路を出力し、経路には値が 3 のノードを含まない");
  for (List<TreeNode> path in res) {
    print(List.from(path.map((e) => e.val)));
  }
}
