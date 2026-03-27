/**
 * File: space_complexity.dart
 * Created Time: 2023-2-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:collection';
import '../utils/list_node.dart';
import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Функция */
int function() {
  // Выполнить некоторые операции
  return 0;
}

/* Постоянная сложность */
void constant(int n) {
  // Константы, переменные и объекты занимают O(1) памяти
  final int a = 0;
  int b = 0;
  List<int> nums = List.filled(10000, 0);
  ListNode node = ListNode(0);
  // Переменные в цикле занимают O(1) памяти
  for (var i = 0; i < n; i++) {
    int c = 0;
  }
  // Функции в цикле занимают O(1) памяти
  for (var i = 0; i < n; i++) {
    function();
  }
}

/* Линейная сложность */
void linear(int n) {
  // Массив длины n занимает O(n) памяти
  List<int> nums = List.filled(n, 0);
  // Список длины n занимает O(n) памяти
  List<ListNode> nodes = [];
  for (var i = 0; i < n; i++) {
    nodes.add(ListNode(i));
  }
  // Хеш-таблица длины n занимает O(n) памяти
  Map<int, String> map = HashMap();
  for (var i = 0; i < n; i++) {
    map.putIfAbsent(i, () => i.toString());
  }
}

/* Линейная сложность (рекурсивная реализация) */
void linearRecur(int n) {
  print('Рекурсия n = $n');
  if (n == 1) return;
  linearRecur(n - 1);
}

/* Квадратичная сложность */
void quadratic(int n) {
  // Матрица занимает O(n^2) памяти
  List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
  // Двумерный список занимает O(n^2) памяти
  List<List<int>> numList = [];
  for (var i = 0; i < n; i++) {
    List<int> tmp = [];
    for (int j = 0; j < n; j++) {
      tmp.add(0);
    }
    numList.add(tmp);
  }
}

/* Квадратичная сложность (рекурсивная реализация) */
int quadraticRecur(int n) {
  if (n <= 0) return 0;
  List<int> nums = List.filled(n, 0);
  print('В рекурсии n = $n длина nums = ${nums.length}');
  return quadraticRecur(n - 1);
}

/* Экспоненциальная сложность (построение полного двоичного дерева) */
TreeNode? buildTree(int n) {
  if (n == 0) return null;
  TreeNode root = TreeNode(0);
  root.left = buildTree(n - 1);
  root.right = buildTree(n - 1);
  return root;
}

/* Driver Code */
void main() {
  int n = 5;
  // Постоянная сложность
  constant(n);
  // Линейная сложность
  linear(n);
  linearRecur(n);
  // Квадратичная сложность
  quadratic(n);
  quadraticRecur(n);
  // Экспоненциальная сложность
  TreeNode? root = buildTree(n);
  printTree(root);
}
