/**
 * File: avl_tree.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';
import '../utils/print_util.dart';
import '../utils/tree_node.dart';

class AVLTree {
  TreeNode? root;

  /* Конструктор */
  AVLTree() {
    root = null;
  }

  /* Получить высоту узла */
  int height(TreeNode? node) {
    // Высота пустого узла равна -1, высота листа равна 0
    return node == null ? -1 : node.height;
  }

  /* Обновить высоту узла */
  void updateHeight(TreeNode? node) {
    // Высота узла на 1 больше высоты самого высокого поддерева
    node!.height = max(height(node.left), height(node.right)) + 1;
  }

  /* Получить коэффициент баланса */
  int balanceFactor(TreeNode? node) {
    // Коэффициент баланса пустого узла равен 0
    if (node == null) return 0;
    // Коэффициент баланса узла равен высоте левого поддерева минус высота правого
    return height(node.left) - height(node.right);
  }

  /* Правый поворот */
  TreeNode? rightRotate(TreeNode? node) {
    TreeNode? child = node!.left;
    TreeNode? grandChild = child!.right;
    // Повернуть node вправо вокруг child
    child.right = node;
    node.left = grandChild;
    // Обновить высоту узла
    updateHeight(node);
    updateHeight(child);
    // Вернуть корень поддерева после поворота
    return child;
  }

  /* Левый поворот */
  TreeNode? leftRotate(TreeNode? node) {
    TreeNode? child = node!.right;
    TreeNode? grandChild = child!.left;
    // Повернуть node влево вокруг child
    child.left = node;
    node.right = grandChild;
    // Обновить высоту узла
    updateHeight(node);
    updateHeight(child);
    // Вернуть корень поддерева после поворота
    return child;
  }

  /* Выполнить поворот, чтобы восстановить баланс поддерева */
  TreeNode? rotate(TreeNode? node) {
    // Получить коэффициент баланса узла node
    int factor = balanceFactor(node);
    // Перевес влево
    if (factor > 1) {
      if (balanceFactor(node!.left) >= 0) {
        // Поворот вправо
        return rightRotate(node);
      } else {
        // Сначала поворот влево, затем вправо
        node.left = leftRotate(node.left);
        return rightRotate(node);
      }
    }
    // Перевес вправо
    if (factor < -1) {
      if (balanceFactor(node!.right) <= 0) {
        // Поворот влево
        return leftRotate(node);
      } else {
        // Сначала поворот вправо, затем влево
        node.right = rightRotate(node.right);
        return leftRotate(node);
      }
    }
    // Дерево сбалансировано: завершить вызов без поворота
    return node;
  }

  /* Вставка узла */
  void insert(int val) {
    root = insertHelper(root, val);
  }

  /* Рекурсивная вставка узла (вспомогательный метод) */
  TreeNode? insertHelper(TreeNode? node, int val) {
    if (node == null) return TreeNode(val);
    /* 1. Найти место вставки и вставить узел */
    if (val < node.val)
      node.left = insertHelper(node.left, val);
    else if (val > node.val)
      node.right = insertHelper(node.right, val);
    else
      return node; // Такой узел уже есть: завершить вызов без вставки
    updateHeight(node); // Обновить высоту узла
    /* 2. Восстановить баланс поддерева с помощью поворота */
    node = rotate(node);
    // Вернуть корень поддерева
    return node;
  }

  /* Удаление узла */
  void remove(int val) {
    root = removeHelper(root, val);
  }

  /* Рекурсивное удаление узла (вспомогательный метод) */
  TreeNode? removeHelper(TreeNode? node, int val) {
    if (node == null) return null;
    /* 1. Найти и удалить узел */
    if (val < node.val)
      node.left = removeHelper(node.left, val);
    else if (val > node.val)
      node.right = removeHelper(node.right, val);
    else {
      if (node.left == null || node.right == null) {
        TreeNode? child = node.left ?? node.right;
        // Нет потомков: удалить node и завершить вызов
        if (child == null)
          return null;
        // Один потомок: удалить node
        else
          node = child;
      } else {
        // Два потомка: удалить следующий узел симметричного обхода и заменить им текущий узел
        TreeNode? temp = node.right;
        while (temp!.left != null) {
          temp = temp.left;
        }
        node.right = removeHelper(node.right, temp.val);
        node.val = temp.val;
      }
    }
    updateHeight(node); // Обновить высоту узла
    /* 2. Восстановить баланс поддерева с помощью поворота */
    node = rotate(node);
    // Вернуть корень поддерева
    return node;
  }

  /* Поиск узла */
  TreeNode? search(int val) {
    TreeNode? cur = root;
    // Искать в цикле до выхода за пределы листа
    while (cur != null) {
      // Искомый узел в правом поддереве cur
      if (val < cur.val)
        cur = cur.left;
      // Искомый узел в левом поддереве cur
      else if (val > cur.val)
        cur = cur.right;
      // Значения искомого и текущего узлов совпадают
      else
        break;
    }
    return cur;
  }
}

void testInsert(AVLTree tree, int val) {
  tree.insert(val);
  print("\nАВЛ-дерево после вставки узла $val:");
  printTree(tree.root);
}

void testRemove(AVLTree tree, int val) {
  tree.remove(val);
  print("\nАВЛ-дерево после удаления узла $val:");
  printTree(tree.root);
}

/* Основная программа */
void main() {
  /* Инициализация пустого АВЛ-дерева */
  AVLTree avlTree = AVLTree();
  /* Вставка узла */
  // Проследите, как АВЛ-дерево сохраняет баланс после вставки узла
  testInsert(avlTree, 1);
  testInsert(avlTree, 2);
  testInsert(avlTree, 3);
  testInsert(avlTree, 4);
  testInsert(avlTree, 5);
  testInsert(avlTree, 8);
  testInsert(avlTree, 7);
  testInsert(avlTree, 9);
  testInsert(avlTree, 10);
  testInsert(avlTree, 6);

  /* Вставка повторяющегося узла */
  testInsert(avlTree, 7);

  /* Удаление узла */
  // Проследите, как АВЛ-дерево сохраняет баланс после удаления узла
  testRemove(avlTree, 8); // Удаление узла без потомков
  testRemove(avlTree, 5); // Удаление узла с одним потомком
  testRemove(avlTree, 4); // Удаление узла с двумя потомками

  /* Поиск узла */
  TreeNode? node = avlTree.search(7);
  print("\nНайденный узел: $node, значение узла = ${node!.val}");
}
