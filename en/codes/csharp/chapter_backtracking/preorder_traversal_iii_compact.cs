/**
 * File: preorder_traversal_iii_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_compact {
    List<TreeNode> path = [];
    List<List<TreeNode>> res = [];

    /* Preorder traversal: example 3 */
    void PreOrder(TreeNode? root) {
        // Prune
        if (root == null || root.val == 3) {
            return;
        }
        // Try
        path.Add(root);
        if (root.val == 7) {
            // Record the solution
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // Backtrack
        path.RemoveAt(path.Count - 1);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nInitialize the binary tree");
        PrintUtil.PrintTree(root);

        // Preorder traversal
        PreOrder(root);

        Console.WriteLine("\nOutput all paths from the root to nodes with value 7 that contain no node with value 3");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
