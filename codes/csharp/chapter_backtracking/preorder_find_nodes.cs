/**
 * File: preorder_find_nodes.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

using hello_algo.include;
using NUnit.Framework;
using System.IO;

namespace hello_algo.chapter_backtracking;

public class preorder_find_nodes
{
    static List<TreeNode> res;

    /* 前序遍历 */
    static void preOrder(TreeNode root)
    {
        if (root == null)
        {
            return;
        }
        if (root.val == 7)
        {
            // 记录解
            res.Add(root);
        }
        preOrder(root.left);
        preOrder(root.right);
    }

    [Test]
    public void Test()
    {
        TreeNode root = TreeNode.ListToTree(new List<int?> { 1, 7, 3, 4, 5, 6, 7 });
        Console.WriteLine("\n初始化二叉树");
        PrintUtil.PrintTree(root);

        // 前序遍历
        res = new List<TreeNode>();
        preOrder(root);

        Console.WriteLine("\n输出所有值为 7 的节点");
        PrintUtil.PrintList(res.Select(p => p.val).ToList());
    }
}