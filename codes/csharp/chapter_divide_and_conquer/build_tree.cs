/**
* File: build_tree.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class build_tree {
    /* 构建二叉树：分治 */
    public TreeNode dfs(int[] preorder, int[] inorder, Dictionary<int, int> hmap, int i, int l, int r) {
        // 子树区间为空时终止
        if (r - l < 0)
            return null;
        // 初始化根节点
        TreeNode root = new TreeNode(preorder[i]);
        // 查询 m ，从而划分左右子树
        int m = hmap[preorder[i]];
        // 子问题：构建左子树
        root.left = dfs(preorder, inorder, hmap, i + 1, l, m - 1);
        // 子问题：构建右子树
        root.right = dfs(preorder, inorder, hmap, i + 1 + m - l, m + 1, r);
        // 返回根节点
        return root;
    }

    /* 构建二叉树 */
    public TreeNode buildTree(int[] preorder, int[] inorder) {
        // 初始化哈希表，存储 inorder 元素到索引的映射
        Dictionary<int, int> hmap = new Dictionary<int, int>();
        for (int i = 0; i < inorder.Length; i++) {
            hmap.TryAdd(inorder[i], i);
        }
        TreeNode root = dfs(preorder, inorder, hmap, 0, 0, inorder.Length - 1);
        return root;
    }

    [Test]
    public void Test() {
        int[] preorder = { 3, 9, 2, 1, 7 };
        int[] inorder = { 9, 3, 1, 2, 7 };
        Console.WriteLine("前序遍历 = " + string.Join(", ", preorder));
        Console.WriteLine("中序遍历 = " + string.Join(", ", inorder));

        TreeNode root = buildTree(preorder, inorder);
        Console.WriteLine("构建的二叉树为：");
        PrintUtil.PrintTree(root);
    }
}
