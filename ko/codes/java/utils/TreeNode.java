/**
 * File: TreeNode.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package utils;

import java.util.*;

/* 이진 트리 노드 클래스 */
public class TreeNode {
    public int val; // 노드 값
    public int height; // 노드 높이
    public TreeNode left; // 왼쪽 자식 노드 참조
    public TreeNode right; // 오른쪽 자식 노드 참조

    /* 생성자 */
    public TreeNode(int x) {
        val = x;
    }

    // 직렬화 인코딩 규칙은 다음을 참고한다:
    // https://www.hello-algo.com/ko/chapter_tree/array_representation_of_tree/
    // 이진 트리의 배열 표현:
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // 이진 트리의 연결 리스트 표현:
    //             /——— 15
    //         /——— 7
    //     /——— 3
    //    |    \——— 6
    //    |        \——— 12
    // ——— 1
    //     \——— 2
    //        |    /——— 9
    //         \——— 4
    //             \——— 8

    /* 리스트를 이진 트리로 역직렬화: 재귀 */
    private static TreeNode listToTreeDFS(List<Integer> arr, int i) {
        if (i < 0 || i >= arr.size() || arr.get(i) == null) {
            return null;
        }
        TreeNode root = new TreeNode(arr.get(i));
        root.left = listToTreeDFS(arr, 2 * i + 1);
        root.right = listToTreeDFS(arr, 2 * i + 2);
        return root;
    }

    /* 리스트를 이진 트리로 역직렬화 */
    public static TreeNode listToTree(List<Integer> arr) {
        return listToTreeDFS(arr, 0);
    }

    /* 이진 트리를 리스트로 직렬화: 재귀 */
    private static void treeToListDFS(TreeNode root, int i, List<Integer> res) {
        if (root == null)
            return;
        while (i >= res.size()) {
            res.add(null);
        }
        res.set(i, root.val);
        treeToListDFS(root.left, 2 * i + 1, res);
        treeToListDFS(root.right, 2 * i + 2, res);
    }

    /* 이진 트리를 리스트로 직렬화 */
    public static List<Integer> treeToList(TreeNode root) {
        List<Integer> res = new ArrayList<>();
        treeToListDFS(root, 0, res);
        return res;
    }
}
