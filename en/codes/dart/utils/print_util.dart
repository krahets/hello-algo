/**
 * File: print_util.dart
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:io';

import 'list_node.dart';
import 'tree_node.dart';

class Trunk {
  Trunk? prev;
  String str;

  Trunk(this.prev, this.str);
}

/* 打印矩阵 (Array) */
void printMatrix(List<List<int>> matrix) {
  print("[");
  for (List<int> row in matrix) {
    print("  $row,");
  }
  print("]");
}

/* 打印链表 */
void printLinkedList(ListNode? head) {
  List<String> list = [];

  while (head != null) {
    list.add('${head.val}');
    head = head.next;
  }

  print(list.join(' -> '));
}

/**
 * 打印二叉树
 * This tree printer is borrowed from TECHIE DELIGHT
 * https://www.techiedelight.com/c-program-print-binary-tree/
 */
void printTree(TreeNode? root, [Trunk? prev = null, bool isRight = false]) {
  if (root == null) {
    return;
  }

  String prev_str = '    ';
  Trunk trunk = Trunk(prev, prev_str);

  printTree(root.right, trunk, true);

  if (prev == null) {
    trunk.str = '———';
  } else if (isRight) {
    trunk.str = '/———';
    prev_str = '   |';
  } else {
    trunk.str = '\\———';
    prev.str = prev_str;
  }
  showTrunks(trunk);
  print(' ${root.val}');

  if (prev != null) {
    prev.str = prev_str;
  }
  trunk.str = '   |';

  printTree(root.left, trunk, false);
}

void showTrunks(Trunk? p) {
  if (p == null) {
    return;
  }

  showTrunks(p.prev);
  stdout.write(p.str);
}

/* 打印堆 */
void printHeap(List<int> heap) {
  print("堆的数组表示：$heap");
  print("堆的树状表示：");
  TreeNode? root = listToTree(heap);
  printTree(root);
}
