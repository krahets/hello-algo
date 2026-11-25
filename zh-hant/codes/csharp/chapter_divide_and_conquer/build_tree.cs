/**
* File: build_tree.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class build_tree {
    /* 建構二元樹：分治法 */
    TreeNode? DFS(int[] preorder, Dictionary<int, int> inorderMap, int i, int l, int r) {
        // 子樹區間為空時終止
        if (r - l < 0)
            return null;
        // 初始化根節點
        TreeNode root = new(preorder[i]);
        // 查出 m，據此劃分左右子樹
        int m = inorderMap[preorder[i]];
        // 子問題：建構左子樹
        root.left = DFS(preorder, inorderMap, i + 1, l, m - 1);
        // 子問題：建構右子樹
        root.right = DFS(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 回傳根節點
        return root;
    }

    /* 建構二元樹 */
    TreeNode? BuildTree(int[] preorder, int[] inorder) {
        // 初始化雜湊表，記錄 inorder 中各元素對應的索引
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
        Console.WriteLine("前序走訪 = " + string.Join(", ", preorder));
        Console.WriteLine("中序走訪 = " + string.Join(", ", inorder));

        TreeNode? root = BuildTree(preorder, inorder);
        Console.WriteLine("建構出的二元樹為：");
        PrintUtil.PrintTree(root);
    }
}
