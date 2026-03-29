/**
 * File: binary_tree_dfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_dfs {
    List<int> list = [];

    /* 先行順走査 */
    void PreOrder(TreeNode? root) {
        if (root == null) return;
        // 訪問順序：根ノード -> 左部分木 -> 右部分木
        list.Add(root.val!.Value);
        PreOrder(root.left);
        PreOrder(root.right);
    }

    /* 中順走査 */
    void InOrder(TreeNode? root) {
        if (root == null) return;
        // 訪問優先順: 左部分木 -> 根ノード -> 右部分木
        InOrder(root.left);
        list.Add(root.val!.Value);
        InOrder(root.right);
    }

    /* 後順走査 */
    void PostOrder(TreeNode? root) {
        if (root == null) return;
        // 訪問優先順: 左部分木 -> 右部分木 -> 根ノード
        PostOrder(root.left);
        PostOrder(root.right);
        list.Add(root.val!.Value);
    }

    [Test]
    public void Test() {
        /* 二分木を初期化 */
        // ここでは、配列から直接二分木を生成する関数を利用する
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n二分木を初期化\n");
        PrintUtil.PrintTree(root);

        list.Clear();
        PreOrder(root);
        Console.WriteLine("\n前順走査のノード出力シーケンス = " + string.Join(",", list));

        list.Clear();
        InOrder(root);
        Console.WriteLine("\n中順走査のノード出力シーケンス = " + string.Join(",", list));

        list.Clear();
        PostOrder(root);
        Console.WriteLine("\n後順走査のノード出力シーケンス = " + string.Join(",", list));
    }
}
