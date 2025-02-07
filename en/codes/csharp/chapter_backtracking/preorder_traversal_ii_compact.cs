// File: preorder_traversal_ii_compact.cs
// Created Time: 2025-02-07
// Author: Xylphy (github.com/Xylphy)

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_ii_compact {
    List<TreeNode> path = [];
    List<List<TreeNode>> res = [];

    /* Preorder Traversal: Example II */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        // Attempt
        path.Add(root);
        if (root.val == 7) {
            // Record solution
            res.Add([.. path]);
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // Backtrack
        path.RemoveAt(path.Count - 1);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nInitialize binary tree");
        PrintUtil.PrintTree(root);

        // Preorder traversal
        PreOrder(root);

        Console.WriteLine("\nOutput all paths from root to node 7");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
