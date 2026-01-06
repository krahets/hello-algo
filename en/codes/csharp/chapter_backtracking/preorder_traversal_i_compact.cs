/**
 * File: preorder_traversal_i_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_i_compact {
    List<TreeNode> res = [];

    /* Preorder traversal: Example 1 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // Record solution
            res.Add(root);
        }
        PreOrder(root.left);
        PreOrder(root.right);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nInitialize binary tree");
        PrintUtil.PrintTree(root);

        // Preorder traversal
        PreOrder(root);

        Console.WriteLine("\nOutput all nodes with value 7");
        PrintUtil.PrintList(res.Select(p => p.val).ToList());
    }
}
