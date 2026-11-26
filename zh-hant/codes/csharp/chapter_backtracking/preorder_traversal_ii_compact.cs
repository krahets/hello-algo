/**
 * File: preorder_traversal_ii_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_ii_compact {
    List<TreeNode> path = [];
    List<List<TreeNode>> res = [];

    /* 前序走訪：例題二 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        // 嘗試
        path.Add(root);
        if (root.val == 7) {
            // 記錄此解
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // 回溯
        path.RemoveAt(path.Count - 1);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n初始化二元樹");
        PrintUtil.PrintTree(root);

        // 前序走訪
        PreOrder(root);

        Console.WriteLine("\n輸出從根節點到值為 7 的節點的所有路徑");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
