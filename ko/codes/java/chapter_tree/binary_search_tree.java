/**
 * File: binary_search_tree.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

/* 이진 탐색 트리 */
class BinarySearchTree {
    private TreeNode root;

    /* 생성자 */
    public BinarySearchTree() {
        // 빈 트리 초기화
        root = null;
    }

    /* 이진 트리의 루트 노드 구하기 */
    public TreeNode getRoot() {
        return root;
    }

    /* 노드 탐색 */
    public TreeNode search(int num) {
        TreeNode cur = root;
        // 반복해서 찾다가 리프 노드를 지나면 종료한다
        while (cur != null) {
            // 찾는 노드는 cur의 오른쪽 서브트리에 있다
            if (cur.val < num)
                cur = cur.right;
            // 찾는 노드는 cur의 왼쪽 서브트리에 있다
            else if (cur.val > num)
                cur = cur.left;
            // 찾는 노드를 발견했으므로 반복문을 종료한다
            else
                break;
        }
        // 찾은 노드를 반환한다
        return cur;
    }

    /* 노드 삽입 */
    public void insert(int num) {
        // 트리가 비어 있으면 루트 노드를 초기화한다
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // 반복해서 찾다가 리프 노드를 지나면 종료한다
        while (cur != null) {
            // 같은 값의 노드를 찾으면 바로 반환한다
            if (cur.val == num)
                return;
            pre = cur;
            // 삽입 위치는 cur의 오른쪽 서브트리에 있다
            if (cur.val < num)
                cur = cur.right;
            // 삽입 위치는 cur의 왼쪽 서브트리에 있다
            else
                cur = cur.left;
        }
        // 노드 삽입
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }

    /* 노드 삭제 */
    public void remove(int num) {
        // 트리가 비어 있으면 바로 반환한다
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // 반복해서 찾다가 리프 노드를 지나면 종료한다
        while (cur != null) {
            // 삭제할 노드를 찾았으므로 반복문을 종료한다
            if (cur.val == num)
                break;
            pre = cur;
            // 삭제할 노드는 cur의 오른쪽 서브트리에 있다
            if (cur.val < num)
                cur = cur.right;
            // 삭제할 노드는 cur의 왼쪽 서브트리에 있다
            else
                cur = cur.left;
        }
        // 삭제할 노드가 없으면 바로 반환한다
        if (cur == null)
            return;
        // 자식 수 = 0 또는 1
        if (cur.left == null || cur.right == null) {
            // 자식 수가 0이면 child는 null, 1이면 child는 그 자식 노드다
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // 노드 cur 삭제
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 삭제할 노드가 루트라면 루트 노드를 다시 지정한다
                root = child;
            }
        }
        // 자식 수 = 2
        else {
            // 중위 순회에서 cur 다음에 오는 노드를 구한다
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // 노드 tmp를 재귀적으로 삭제한다
            remove(tmp.val);
            // cur의 값을 tmp의 값으로 덮어쓴다
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    public static void main(String[] args) {
        /* 이진 탐색 트리 초기화 */
        BinarySearchTree bst = new BinarySearchTree();
        // 삽입 순서가 다르면 이진 트리의 모양도 달라진다. 이 순서로 삽입하면 포화 이진 트리가 만들어진다
        int[] nums = { 8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15 };
        for (int num : nums) {
            bst.insert(num);
        }
        System.out.println("\n초기화한 이진 트리:\n");
        PrintUtil.printTree(bst.getRoot());

        /* 노드 탐색 */
        TreeNode node = bst.search(7);
        System.out.println("\n찾은 노드 객체: " + node + ", 노드 값 = " + node.val);

        /* 노드 삽입 */
        bst.insert(16);
        System.out.println("\n노드 16 삽입 후 이진 트리:\n");
        PrintUtil.printTree(bst.getRoot());

        /* 노드 삭제 */
        bst.remove(1);
        System.out.println("\n노드 1 삭제 후 이진 트리:\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(2);
        System.out.println("\n노드 2 삭제 후 이진 트리:\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(4);
        System.out.println("\n노드 4 삭제 후 이진 트리:\n");
        PrintUtil.printTree(bst.getRoot());
    }
}
