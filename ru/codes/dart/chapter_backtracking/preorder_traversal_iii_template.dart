/**
 * File: preorder_traversal_iii_template.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Проверить, является ли текущее состояние решением */
bool isSolution(List<TreeNode> state) {
  return state.isNotEmpty && state.last.val == 7;
}

/* Записать решение */
void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
  res.add(List.from(state));
}

/* Проверить, допустим ли этот выбор в текущем состоянии */
bool isValid(List<TreeNode> state, TreeNode? choice) {
  return choice != null && choice.val != 3;
}

/* Обновить состояние */
void makeChoice(List<TreeNode> state, TreeNode? choice) {
  state.add(choice!);
}

/* Восстановить состояние */
void undoChoice(List<TreeNode> state, TreeNode? choice) {
  state.removeLast();
}

/* Алгоритм бэктрекинга: пример 3 */
void backtrack(
  List<TreeNode> state,
  List<TreeNode?> choices,
  List<List<TreeNode>> res,
) {
  // Проверить, является ли текущее состояние решением
  if (isSolution(state)) {
    // Записать решение
    recordSolution(state, res);
  }
  // Перебор всех вариантов выбора
  for (TreeNode? choice in choices) {
    // Отсечение: проверить допустимость выбора
    if (isValid(state, choice)) {
      // Попытка: сделать выбор и обновить состояние
      makeChoice(state, choice);
      // Перейти к следующему выбору
      backtrack(state, [choice!.left, choice.right], res);
      // Откат: отменить выбор и восстановить предыдущее состояние
      undoChoice(state, choice);
    }
  }
}

/* Driver Code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\nИнициализация двоичного дерева");
  printTree(root);

  // Алгоритм бэктрекинга
  List<List<TreeNode>> res = [];
  backtrack([], [root!], res);
  print("\nВсе пути от корня к узлу 7, в которых путь не содержит узлов со значением 3");
  for (List<TreeNode> path in res) {
    print(List.from(path.map((e) => e.val)));
  }
}
