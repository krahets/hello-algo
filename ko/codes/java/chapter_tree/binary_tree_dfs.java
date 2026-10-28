/**
 * File: binary_tree_dfs.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

public class binary_tree_dfs {
    // 순회 순서를 저장할 리스트를 초기화한다
    static ArrayList<Integer> list = new ArrayList<>();

    /* 전위 순회 */
    static void preOrder(TreeNode root) {
        if (root == null)
            return;
        // 방문 우선순위: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
        list.add(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* 중위 순회 */
    static void inOrder(TreeNode root) {
        if (root == null)
            return;
        // 방문 우선순위: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
        inOrder(root.left);
        list.add(root.val);
        inOrder(root.right);
    }

    /* 후위 순회 */
    static void postOrder(TreeNode root) {
        if (root == null)
            return;
        // 방문 우선순위: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
        postOrder(root.left);
        postOrder(root.right);
        list.add(root.val);
    }

    public static void main(String[] args) {
        /* 이진 트리 초기화 */
        // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\n이진 트리 초기화\n");
        PrintUtil.printTree(root);

        /* 전위 순회 */
        list.clear();
        preOrder(root);
        System.out.println("\n전위 순회의 노드 출력 순서 = " + list);

        /* 중위 순회 */
        list.clear();
        inOrder(root);
        System.out.println("\n중위 순회의 노드 출력 순서 = " + list);

        /* 후위 순회 */
        list.clear();
        postOrder(root);
        System.out.println("\n후위 순회의 노드 출력 순서 = " + list);
    }
}
