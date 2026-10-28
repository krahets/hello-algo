/**
 * File: build_tree.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import utils.*;
import java.util.*;

public class build_tree {
    /* 이진 트리 구성: 분할 정복 */
    static TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // 서브트리 구간이 비어 있으면 종료한다
        if (r - l < 0)
            return null;
        // 루트 노드를 초기화한다
        TreeNode root = new TreeNode(preorder[i]);
        // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        int m = inorderMap.get(preorder[i]);
        // 부분 문제: 왼쪽 서브트리 구성
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 부분 문제: 오른쪽 서브트리 구성
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 루트 노드를 반환한다
        return root;
    }

    /* 이진 트리 구성 */
    static TreeNode buildTree(int[] preorder, int[] inorder) {
        // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        Map<Integer, Integer> inorderMap = new HashMap<>();
        for (int i = 0; i < inorder.length; i++) {
            inorderMap.put(inorder[i], i);
        }
        TreeNode root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
        return root;
    }

    public static void main(String[] args) {
        int[] preorder = { 3, 9, 2, 1, 7 };
        int[] inorder = { 9, 3, 1, 2, 7 };
        System.out.println("전위 순회 = " + Arrays.toString(preorder));
        System.out.println("중위 순회 = " + Arrays.toString(inorder));

        TreeNode root = buildTree(preorder, inorder);
        System.out.println("구성한 이진 트리:");
        PrintUtil.printTree(root);
    }
}
