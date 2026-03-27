/**
 * File: array_binary_tree.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Класс двоичного дерева в массивном представлении */
class ArrayBinaryTree {
  late List<int?> _tree;

  /* Конструктор */
  ArrayBinaryTree(this._tree);

  /* Вместимость списка */
  int size() {
    return _tree.length;
  }

  /* Получить значение узла с индексом i */
  int? val(int i) {
    // Если индекс выходит за границы, вернуть null, обозначающий пустую позицию
    if (i < 0 || i >= size()) {
      return null;
    }
    return _tree[i];
  }

  /* Получить индекс левого дочернего узла узла с индексом i */
  int? left(int i) {
    return 2 * i + 1;
  }

  /* Получить индекс правого дочернего узла узла с индексом i */
  int? right(int i) {
    return 2 * i + 2;
  }

  /* Получить индекс родительского узла узла с индексом i */
  int? parent(int i) {
    return (i - 1) ~/ 2;
  }

  /* Обход в ширину */
  List<int> levelOrder() {
    List<int> res = [];
    for (int i = 0; i < size(); i++) {
      if (val(i) != null) {
        res.add(val(i)!);
      }
    }
    return res;
  }

  /* Обход в глубину */
  void dfs(int i, String order, List<int?> res) {
    // Если это пустая позиция, вернуть
    if (val(i) == null) {
      return;
    }
    // Предварительный обход
    if (order == 'pre') {
      res.add(val(i));
    }
    dfs(left(i)!, order, res);
    // Симметричный обход
    if (order == 'in') {
      res.add(val(i));
    }
    dfs(right(i)!, order, res);
    // Обратный обход
    if (order == 'post') {
      res.add(val(i));
    }
  }

  /* Предварительный обход */
  List<int?> preOrder() {
    List<int?> res = [];
    dfs(0, 'pre', res);
    return res;
  }

  /* Симметричный обход */
  List<int?> inOrder() {
    List<int?> res = [];
    dfs(0, 'in', res);
    return res;
  }

  /* Обратный обход */
  List<int?> postOrder() {
    List<int?> res = [];
    dfs(0, 'post', res);
    return res;
  }
}

/* Driver Code */
void main() {
  // Инициализировать двоичное дерево
  // Здесь используется функция, напрямую строящая двоичное дерево из массива
  List<int?> arr = [
    1,
    2,
    3,
    4,
    null,
    6,
    7,
    8,
    9,
    null,
    null,
    12,
    null,
    null,
    15
  ];

  TreeNode? root = listToTree(arr);
  print("\nИнициализация двоичного дерева\n");
  print("Массивное представление двоичного дерева:");
  print(arr);
  print("Связное представление двоичного дерева:");
  printTree(root);

  // Класс двоичного дерева в массивном представлении
  ArrayBinaryTree abt = ArrayBinaryTree(arr);

  // Доступ к узлу
  int i = 1;
  int? l = abt.left(i);
  int? r = abt.right(i);
  int? p = abt.parent(i);
  print("\nТекущий узел: индекс = $i, значение = ${abt.val(i)}");
  print("Индекс левого дочернего узла = $l, значение = ${(l == null ? "null" : abt.val(l))}");
  print("Индекс правого дочернего узла = $r, значение = ${(r == null ? "null" : abt.val(r))}");
  print("Индекс родительского узла = $p, значение = ${(p == null ? "null" : abt.val(p))}");

  // Обходить дерево
  List<int?> res = abt.levelOrder();
  print("\nОбход в ширину = $res");
  res = abt.preOrder();
  print("Предварительный обход = $res");
  res = abt.inOrder();
  print("Симметричный обход = $res");
  res = abt.postOrder();
  print("Обратный обход = $res");
}
