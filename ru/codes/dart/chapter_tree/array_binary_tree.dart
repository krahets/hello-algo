/**
 * File: array_binary_tree.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Класс двоичного дерева на основе массива */
class ArrayBinaryTree {
  late List<int?> _tree;

  /* Конструктор */
  ArrayBinaryTree(this._tree);

  /* Ёмкость списка */
  int size() {
    return _tree.length;
  }

  /* Получить значение узла с индексом i */
  int? val(int i) {
    // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
    if (i < 0 || i >= size()) {
      return null;
    }
    return _tree[i];
  }

  /* Получить индекс левого потомка узла с индексом i */
  int? left(int i) {
    return 2 * i + 1;
  }

  /* Получить индекс правого потомка узла с индексом i */
  int? right(int i) {
    return 2 * i + 2;
  }

  /* Получить индекс родителя узла с индексом i */
  int? parent(int i) {
    return (i - 1) ~/ 2;
  }

  /* Обход по уровням */
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
    // Если позиция пуста, завершить вызов
    if (val(i) == null) {
      return;
    }
    // Прямой обход
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

  /* Прямой обход */
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

/* Основная программа */
void main() {
  // Инициализация двоичного дерева
  // Используем функцию, которая строит двоичное дерево непосредственно из массива
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
  print("Двоичное дерево в виде массива:");
  print(arr);
  print("Связное представление двоичного дерева:");
  printTree(root);

  // Класс двоичного дерева на основе массива
  ArrayBinaryTree abt = ArrayBinaryTree(arr);

  // Доступ к узлу
  int i = 1;
  int? l = abt.left(i);
  int? r = abt.right(i);
  int? p = abt.parent(i);
  print("\nИндекс текущего узла: $i, значение: ${abt.val(i)}");
  print("Индекс левого потомка: $l, значение: ${(l == null ? "null" : abt.val(l))}");
  print("Индекс правого потомка: $r, значение: ${(r == null ? "null" : abt.val(r))}");
  print("Индекс родителя: $p, значение: ${(p == null ? "null" : abt.val(p))}");

  // Обход дерева
  List<int?> res = abt.levelOrder();
  print("\nОбход по уровням: $res");
  res = abt.preOrder();
  print("Прямой обход: $res");
  res = abt.inOrder();
  print("Симметричный обход: $res");
  res = abt.postOrder();
  print("Обратный обход: $res");
}
