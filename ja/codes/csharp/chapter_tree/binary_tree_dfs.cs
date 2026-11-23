/**
 * File: binary_tree_dfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_dfs {
    List<int> list = [];

    /* 行きがけ順走査 */
    void PreOrder(TreeNode? root) {
        if (root == null) return;
        // 訪問順序：根ノード -> 左部分木 -> 右部分木
        list.Add(root.val!.Value);
        PreOrder(root.left);
        PreOrder(root.right);
    }

    /* 通りがけ順走査 */
    void InOrder(TreeNode? root) {
        if (root == null) return;
        // 訪問順序：左部分木 -> 根ノード -> 右部分木
        InOrder(root.left);
        list.Add(root.val!.Value);
        InOrder(root.right);
    }

    /* 帰りがけ順走査 */
    void PostOrder(TreeNode? root) {
        if (root == null) return;
        // 訪問順序：左部分木 -> 右部分木 -> 根ノード
        PostOrder(root.left);
        PostOrder(root.right);
        list.Add(root.val!.Value);
    }

    [Test]
    public void Test() {
        /* 二分木を初期化する */
        // ここでは配列から二分木を直接生成する関数を使う
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n二分木を初期化する\n");
        PrintUtil.PrintTree(root);

        list.Clear();
        PreOrder(root);
        Console.WriteLine("\n行きがけ順走査で表示するノードの順序 = " + string.Join(",", list));

        list.Clear();
        InOrder(root);
        Console.WriteLine("\n通りがけ順走査で表示するノードの順序 = " + string.Join(",", list));

        list.Clear();
        PostOrder(root);
        Console.WriteLine("\n帰りがけ順走査で表示するノードの順序 = " + string.Join(",", list));
    }
}
