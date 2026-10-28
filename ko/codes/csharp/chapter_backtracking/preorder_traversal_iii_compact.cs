/**
 * File: preorder_traversal_iii_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_compact {
    List<TreeNode> path = [];
    List<List<TreeNode>> res = [];

    /* 전위 순회: 예제 3 */
    void PreOrder(TreeNode? root) {
        // 가지치기
        if (root == null || root.val == 3) {
            return;
        }
        // 시도
        path.Add(root);
        if (root.val == 7) {
            // 해를 기록한다
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // 되돌리기
        path.RemoveAt(path.Count - 1);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n이진 트리 초기화");
        PrintUtil.PrintTree(root);

        // 전위 순회
        PreOrder(root);

        Console.WriteLine("\n루트 노드에서 노드 7까지의 모든 경로 출력. 경로에는 값이 3인 노드가 포함되지 않는다");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
