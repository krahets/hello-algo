/**
 * File: preorder_traversal_iii_template.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 현재 상태가 해인지 판단 */
bool isSolution(List<TreeNode> state) {
  return state.isNotEmpty && state.last.val == 7;
}

/* 해를 기록한다 */
void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
  res.add(List.from(state));
}

/* 현재 상태에서 해당 선택이 유효한지 판단 */
bool isValid(List<TreeNode> state, TreeNode? choice) {
  return choice != null && choice.val != 3;
}

/* 상태 갱신 */
void makeChoice(List<TreeNode> state, TreeNode? choice) {
  state.add(choice!);
}

/* 상태 복원 */
void undoChoice(List<TreeNode> state, TreeNode? choice) {
  state.removeLast();
}

/* 백트래킹 알고리즘: 예제 3 */
void backtrack(
  List<TreeNode> state,
  List<TreeNode?> choices,
  List<List<TreeNode>> res,
) {
  // 해인지 확인한다
  if (isSolution(state)) {
    // 해를 기록한다
    recordSolution(state, res);
  }
  // 모든 선택지를 순회한다
  for (TreeNode? choice in choices) {
    // 가지치기: 선택이 유효한지 확인한다
    if (isValid(state, choice)) {
      // 시도: 선택하고 상태를 갱신한다
      makeChoice(state, choice);
      // 다음 선택을 진행한다
      backtrack(state, [choice!.left, choice.right], res);
      // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
      undoChoice(state, choice);
    }
  }
}

/* 실행 코드 */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n이진 트리 초기화");
  printTree(root);

  // 백트래킹 알고리즘
  List<List<TreeNode>> res = [];
  backtrack([], [root!], res);
  print("\n값이 3인 노드를 포함하지 않는 조건으로, 루트 노드에서 노드 7까지의 모든 경로 출력");
  for (List<TreeNode> path in res) {
    print(List.from(path.map((e) => e.val)));
  }
}
