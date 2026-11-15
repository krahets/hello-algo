/**
 * File: TreeNode.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.utils;

/* 이진 트리 노드 클래스 */
public class TreeNode(int? x) {
    public int? val = x;    // 노드 값
    public int height;      // 노드 높이
    public TreeNode? left;  // 왼쪽 자식 노드 참조
    public TreeNode? right; // 오른쪽 자식 노드 참조

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
    static TreeNode? ListToTreeDFS(List<int?> arr, int i) {
        if (i < 0 || i >= arr.Count || !arr[i].HasValue) {
            return null;
        }
        TreeNode root = new(arr[i]) {
            left = ListToTreeDFS(arr, 2 * i + 1),
            right = ListToTreeDFS(arr, 2 * i + 2)
        };
        return root;
    }

    /* 리스트를 이진 트리로 역직렬화 */
    public static TreeNode? ListToTree(List<int?> arr) {
        return ListToTreeDFS(arr, 0);
    }

    /* 이진 트리를 리스트로 직렬화: 재귀 */
    static void TreeToListDFS(TreeNode? root, int i, List<int?> res) {
        if (root == null)
            return;
        while (i >= res.Count) {
            res.Add(null);
        }
        res[i] = root.val;
        TreeToListDFS(root.left, 2 * i + 1, res);
        TreeToListDFS(root.right, 2 * i + 2, res);
    }

    /* 이진 트리를 리스트로 직렬화 */
    public static List<int?> TreeToList(TreeNode root) {
        List<int?> res = [];
        TreeToListDFS(root, 0, res);
        return res;
    }
}
