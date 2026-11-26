/**
 * File: preorder_traversal_iii_template.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Проверяем, является ли текущее состояние решением */
bool isSolution(List<TreeNode> state) {
  return state.isNotEmpty && state.last.val == 7;
}

/* Сохраняем решение */
void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
  res.add(List.from(state));
}

/* Проверяем, допустим ли выбор в текущем состоянии */
bool isValid(List<TreeNode> state, TreeNode? choice) {
  return choice != null && choice.val != 3;
}

/* Обновляем состояние */
void makeChoice(List<TreeNode> state, TreeNode? choice) {
  state.add(choice!);
}

/* Восстанавливаем состояние */
void undoChoice(List<TreeNode> state, TreeNode? choice) {
  state.removeLast();
}

/* Поиск с возвратом: пример 3 */
void backtrack(
  List<TreeNode> state,
  List<TreeNode?> choices,
  List<List<TreeNode>> res,
) {
  // Проверяем, найдено ли решение
  if (isSolution(state)) {
    // Сохраняем решение
    recordSolution(state, res);
  }
  // Перебираем все варианты
  for (TreeNode? choice in choices) {
    // Отсечение: проверяем допустимость выбора
    if (isValid(state, choice)) {
      // Пробуем вариант и обновляем состояние
      makeChoice(state, choice);
      // Переходим к следующему выбору
      backtrack(state, [choice!.left, choice.right], res);
      // Возврат: отменяем выбор и восстанавливаем прежнее состояние
      undoChoice(state, choice);
    }
  }
}

/* Основная программа */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\nСоздаём двоичное дерево");
  printTree(root);

  // Поиск с возвратом
  List<List<TreeNode>> res = [];
  backtrack([], [root!], res);
  print("\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3");
  for (List<TreeNode> path in res) {
    print(List.from(path.map((e) => e.val)));
  }
}
