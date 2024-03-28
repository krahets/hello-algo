/**
 * File: binary_tree_dfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_dfs {
    List<int> list = [];

    /* 前序走訪 */
    void PreOrder(TreeNode? root) {
        if (root == null) return;
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        list.Add(root.val!.Value);
        PreOrder(root.left);
        PreOrder(root.right);
    }

    /* 中序走訪 */
    void InOrder(TreeNode? root) {
        if (root == null) return;
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        InOrder(root.left);
        list.Add(root.val!.Value);
        InOrder(root.right);
    }

    /* 後序走訪 */
    void PostOrder(TreeNode? root) {
        if (root == null) return;
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        PostOrder(root.left);
        PostOrder(root.right);
        list.Add(root.val!.Value);
    }

    [Test]
    public void Test() {
        /* 初始化二元樹 */
        // 這裡藉助了一個從陣列直接生成二元樹的函式
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n初始化二元樹\n");
        PrintUtil.PrintTree(root);

        list.Clear();
        PreOrder(root);
        Console.WriteLine("\n前序走訪的節點列印序列 = " + string.Join(",", list));

        list.Clear();
        InOrder(root);
        Console.WriteLine("\n中序走訪的節點列印序列 = " + string.Join(",", list));

        list.Clear();
        PostOrder(root);
        Console.WriteLine("\n後序走訪的節點列印序列 = " + string.Join(",", list));
    }
}
