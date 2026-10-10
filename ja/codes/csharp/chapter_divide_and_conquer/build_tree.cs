/**
* File: build_tree.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class build_tree {
    /* 二分木を構築：分割統治 */
    TreeNode? DFS(int[] preorder, Dictionary<int, int> inorderMap, int i, int l, int r) {
        // 部分木区間が空なら終了する
        if (r - l < 0)
            return null;
        // ルートノードを初期化する
        TreeNode root = new(preorder[i]);
        // m を求めて左右部分木を分割する
        int m = inorderMap[preorder[i]];
        // 部分問題：左部分木を構築する
        root.left = DFS(preorder, inorderMap, i + 1, l, m - 1);
        // 部分問題：右部分木を構築する
        root.right = DFS(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 根ノードを返す
        return root;
    }

    /* 二分木を構築 */
    TreeNode? BuildTree(int[] preorder, int[] inorder) {
        // inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
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
        Console.WriteLine("前順走査 = " + string.Join(", ", preorder));
        Console.WriteLine("中順走査 = " + string.Join(", ", inorder));

        TreeNode? root = BuildTree(preorder, inorder);
        Console.WriteLine("構築した二分木は次のとおりです：");
        PrintUtil.PrintTree(root);
    }
}
