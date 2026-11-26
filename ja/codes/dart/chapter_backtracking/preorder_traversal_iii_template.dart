/**
 * File: preorder_traversal_iii_template.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 現在の状態が解かどうか判定する */
bool isSolution(List<TreeNode> state) {
  return state.isNotEmpty && state.last.val == 7;
}

/* 解を記録する */
void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
  res.add(List.from(state));
}

/* 現在の状態でその選択が可能か判定する */
bool isValid(List<TreeNode> state, TreeNode? choice) {
  return choice != null && choice.val != 3;
}

/* 状態を更新する */
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
  // 解かどうか調べる
  if (isSolution(state)) {
    // 解を記録する
    recordSolution(state, res);
  }
  // すべての選択肢を調べる
  for (TreeNode? choice in choices) {
    // 枝刈り：その選択が可能か調べる
    if (isValid(state, choice)) {
      // 試行：選択して状態を更新する
      makeChoice(state, choice);
      // 次の選択に進む
      backtrack(state, [choice!.left, choice.right], res);
      // 後戻り：選択を取り消し、元の状態に戻す
      undoChoice(state, choice);
    }
  }
}

/* 実行例 */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n二分木を初期化");
  printTree(root);

  // バックトラッキング
  List<List<TreeNode>> res = [];
  backtrack([], [root!], res);
  print("\n根から値が 7 のノードまでの経路のうち、値が 3 のノードを含まないものをすべて出力");
  for (List<TreeNode> path in res) {
    print(List.from(path.map((e) => e.val)));
  }
}
