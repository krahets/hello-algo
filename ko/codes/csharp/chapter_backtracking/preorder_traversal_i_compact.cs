/**
 * File: preorder_traversal_i_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_i_compact {
    List<TreeNode> res = [];

    /* 전위 순회: 예제 1 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // 해를 기록한다
            res.Add(root);
        }
        PreOrder(root.left);
        PreOrder(root.right);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n이진 트리 초기화");
        PrintUtil.PrintTree(root);

        // 전위 순회
        PreOrder(root);

        Console.WriteLine("\n값이 7인 모든 노드 출력");
        PrintUtil.PrintList(res.Select(p => p.val).ToList());
    }
}
