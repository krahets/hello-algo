/**
 * File: TreeNode.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.utils;

/* 二元樹節點類別 */
public class TreeNode(int? x) {
    public int? val = x;    // 節點值
    public int height;      // 節點高度
    public TreeNode? left;  // 左子節點引用
    public TreeNode? right; // 右子節點引用

    // 序列化編碼規則請參考：
    // https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    // 二元樹的陣列表示：
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // 二元樹的鏈結串列表示：
    //             /——— 15
    //         /——— 7
    //     /——— 3
    //    |    \——— 6
    //    |        \——— 12
    // ——— 1
    //     \——— 2
    //        |    /——— 9
    //         \——— 4
    //             \——— 8

    /* 將串列反序列化為二元樹：遞迴 */
    static TreeNode? ListToTreeDFS(List<int?> arr, int i) {
        if (i < 0 || i >= arr.Count || !arr[i].HasValue) {
            return null;
        }
        TreeNode root = new(arr[i]) {
            left = ListToTreeDFS(arr, 2 * i + 1),
            right = ListToTreeDFS(arr, 2 * i + 2)
        };
        return root;
    }

    /* 將串列反序列化為二元樹 */
    public static TreeNode? ListToTree(List<int?> arr) {
        return ListToTreeDFS(arr, 0);
    }

    /* 將二元樹序列化為串列：遞迴 */
    static void TreeToListDFS(TreeNode? root, int i, List<int?> res) {
        if (root == null)
            return;
        while (i >= res.Count) {
            res.Add(null);
        }
        res[i] = root.val;
        TreeToListDFS(root.left, 2 * i + 1, res);
        TreeToListDFS(root.right, 2 * i + 2, res);
    }

    /* 將二元樹序列化為串列 */
    public static List<int?> TreeToList(TreeNode root) {
        List<int?> res = [];
        TreeToListDFS(root, 0, res);
        return res;
    }
}
