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

  /* 생성자 */
  AVLTree() {
    root = null;
  }

  /* 노드 높이 반환 */
  int height(TreeNode? node) {
    // 빈 노드의 높이는 -1이고, 리프 노드의 높이는 0이다
    return node == null ? -1 : node.height;
  }

  /* 노드 높이를 갱신한다 */
  void updateHeight(TreeNode? node) {
    // 노드 높이는 가장 높은 서브트리의 높이 + 1이다
    node!.height = max(height(node.left), height(node.right)) + 1;
  }

  /* 균형 인수 반환 */
  int balanceFactor(TreeNode? node) {
    // 빈 노드의 균형 인수는 0이다
    if (node == null) return 0;
    // 노드의 균형 인수 = 왼쪽 서브트리 높이 - 오른쪽 서브트리 높이
    return height(node.left) - height(node.right);
  }

  /* 오른쪽 회전 연산 */
  TreeNode? rightRotate(TreeNode? node) {
    TreeNode? child = node!.left;
    TreeNode? grandChild = child!.right;
    // child를 중심으로 node를 오른쪽으로 회전한다
    child.right = node;
    node.left = grandChild;
    // 노드 높이를 갱신한다
    updateHeight(node);
    updateHeight(child);
    // 회전한 서브트리의 루트 노드를 반환한다
    return child;
  }

  /* 왼쪽 회전 연산 */
  TreeNode? leftRotate(TreeNode? node) {
    TreeNode? child = node!.right;
    TreeNode? grandChild = child!.left;
    // child를 중심으로 node를 왼쪽으로 회전한다
    child.left = node;
    node.right = grandChild;
    // 노드 높이를 갱신한다
    updateHeight(node);
    updateHeight(child);
    // 회전한 서브트리의 루트 노드를 반환한다
    return child;
  }

  /* 회전 연산을 수행하여 해당 서브트리의 균형 복원 */
  TreeNode? rotate(TreeNode? node) {
    // 노드 node의 균형 인수를 구한다
    int factor = balanceFactor(node);
    // 왼쪽으로 치우친 트리
    if (factor > 1) {
      if (balanceFactor(node!.left) >= 0) {
        // 오른쪽 회전
        return rightRotate(node);
      } else {
        // 왼쪽으로 회전한 후 오른쪽으로 회전한다
        node.left = leftRotate(node.left);
        return rightRotate(node);
      }
    }
    // 오른쪽으로 치우친 트리
    if (factor < -1) {
      if (balanceFactor(node!.right) <= 0) {
        // 왼쪽 회전
        return leftRotate(node);
      } else {
        // 오른쪽으로 회전한 후 왼쪽으로 회전한다
        node.right = rightRotate(node.right);
        return leftRotate(node);
      }
    }
    // 균형 트리이므로 회전할 필요 없이 바로 반환한다
    return node;
  }

  /* 노드 삽입 */
  void insert(int val) {
    root = insertHelper(root, val);
  }

  /* 노드의 재귀적 삽입(보조 메서드) */
  TreeNode? insertHelper(TreeNode? node, int val) {
    if (node == null) return TreeNode(val);
    /* 1. 삽입 위치를 찾아 노드를 삽입한다 */
    if (val < node.val)
      node.left = insertHelper(node.left, val);
    else if (val > node.val)
      node.right = insertHelper(node.right, val);
    else
      return node; // 중복 노드는 삽입하지 않고 바로 반환한다
    updateHeight(node); // 노드 높이를 갱신한다
    /* 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다 */
    node = rotate(node);
    // 서브트리의 루트 노드를 반환한다
    return node;
  }

  /* 노드 삭제 */
  void remove(int val) {
    root = removeHelper(root, val);
  }

  /* 노드의 재귀적 삭제(보조 메서드) */
  TreeNode? removeHelper(TreeNode? node, int val) {
    if (node == null) return null;
    /* 1. 노드를 찾아 삭제한다 */
    if (val < node.val)
      node.left = removeHelper(node.left, val);
    else if (val > node.val)
      node.right = removeHelper(node.right, val);
    else {
      if (node.left == null || node.right == null) {
        TreeNode? child = node.left ?? node.right;
        // 자식 노드 수 = 0이면 node를 바로 삭제하고 반환한다
        if (child == null)
          return null;
        // 자식 노드 수 = 1이면 node를 바로 삭제한다
        else
          node = child;
      } else {
        // 자식 노드 수 = 2이면 중위 순회의 다음 노드를 삭제하고, 그 노드로 현재 노드를 대체한다
        TreeNode? temp = node.right;
        while (temp!.left != null) {
          temp = temp.left;
        }
        node.right = removeHelper(node.right, temp.val);
        node.val = temp.val;
      }
    }
    updateHeight(node); // 노드 높이를 갱신한다
    /* 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다 */
    node = rotate(node);
    // 서브트리의 루트 노드를 반환한다
    return node;
  }

  /* 노드 탐색 */
  TreeNode? search(int val) {
    TreeNode? cur = root;
    // 반복하여 탐색하다 리프 노드를 지나면 종료한다
    while (cur != null) {
      // 목표 노드는 cur의 오른쪽 서브트리에 있다
      if (val < cur.val)
        cur = cur.left;
      // 목표 노드는 cur의 왼쪽 서브트리에 있다
      else if (val > cur.val)
        cur = cur.right;
      // 목표 노드와 현재 노드가 같다
      else
        break;
    }
    return cur;
  }
}

void testInsert(AVLTree tree, int val) {
  tree.insert(val);
  print("\n노드 삽입($val) 후 AVL 트리");
  printTree(tree.root);
}

void testRemove(AVLTree tree, int val) {
  tree.remove(val);
  print("\n노드 삭제($val) 후 AVL 트리");
  printTree(tree.root);
}

/* 실행 코드 */
void main() {
  /* 빈 AVL 트리 초기화 */
  AVLTree avlTree = AVLTree();
  /* 노드 삽입 */
  // 노드를 삽입한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
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

  /* 중복 노드 삽입 */
  testInsert(avlTree, 7);

  /* 노드 삭제 */
  // 노드를 삭제한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
  testRemove(avlTree, 8); // 차수가 0인 노드 삭제
  testRemove(avlTree, 5); // 차수가 1인 노드 삭제
  testRemove(avlTree, 4); // 차수가 2인 노드 삭제

  /* 노드 조회 */
  TreeNode? node = avlTree.search(7);
  print("\n찾은 노드 객체: $node , 노드 값 = ${node!.val}");
}
