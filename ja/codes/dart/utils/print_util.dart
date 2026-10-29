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

/* 行列を表示する（Array） */
void printMatrix(List<List<int>> matrix) {
  print("[");
  for (List<int> row in matrix) {
    print("  $row,");
  }
  print("]");
}

/* 連結リストを表示する */
void printLinkedList(ListNode? head) {
  List<String> list = [];

  while (head != null) {
    list.add('${head.val}');
    head = head.next;
  }

  print(list.join(' -> '));
}

/**
 * 二分木を表示する
 * この木の表示処理は TECHIE DELIGHT から借用した
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

/* ヒープを表示する */
void printHeap(List<int> heap) {
  print("ヒープの配列表現：$heap");
  print("ヒープの木構造表現：");
  TreeNode? root = listToTree(heap);
  printTree(root);
}
