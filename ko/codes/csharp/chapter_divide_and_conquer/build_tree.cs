/**
* File: build_tree.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class build_tree {
    /* 이진 트리 구성: 분할 정복 */
    TreeNode? DFS(int[] preorder, Dictionary<int, int> inorderMap, int i, int l, int r) {
        // 서브트리 구간이 비어 있으면 종료한다
        if (r - l < 0)
            return null;
        // 루트 노드를 초기화한다
        TreeNode root = new(preorder[i]);
        // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        int m = inorderMap[preorder[i]];
        // 부분 문제: 왼쪽 서브트리 구성
        root.left = DFS(preorder, inorderMap, i + 1, l, m - 1);
        // 부분 문제: 오른쪽 서브트리 구성
        root.right = DFS(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 루트 노드를 반환한다
        return root;
    }

    /* 이진 트리 구성 */
    TreeNode? BuildTree(int[] preorder, int[] inorder) {
        // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        Dictionary<int, int> inorderMap = [];
        for (int i = 0; i < inorder.Length; i++) {
            inorderMap.TryAdd(inorder[i], i);
        }
        TreeNode? root = DFS(preorder, inorderMap, 0, 0, inorder.Length - 1);
        return root;
    }

    [Test]
    public void Test() {
        int[] preorder = [3, 9, 2, 1, 7];
        int[] inorder = [9, 3, 1, 2, 7];
        Console.WriteLine("전위 순회 = " + string.Join(", ", preorder));
        Console.WriteLine("중위 순회 = " + string.Join(", ", inorder));

        TreeNode? root = BuildTree(preorder, inorder);
        Console.WriteLine("구성한 이진 트리:");
        PrintUtil.PrintTree(root);
    }
}
