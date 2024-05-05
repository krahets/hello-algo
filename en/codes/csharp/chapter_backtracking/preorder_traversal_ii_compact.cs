/**
 * File: preorder_traversal_ii_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_ii_compact {
    List<TreeNode> path = [];
    List<List<TreeNode>> res = [];

    /* Pre-order traversal: Example two */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        // Attempt
        path.Add(root);
        if (root.val == 7) {
            // Record solution
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // Retract
        path.RemoveAt(path.Count - 1);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nInitialize binary tree");
        PrintUtil.PrintTree(root);

        // Pre-order traversal
        PreOrder(root);

        Console.WriteLine("\nOutput all root-to-node 7 paths");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
