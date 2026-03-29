/**
 * File: TreeNode.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.utils;

/* 二分木ノードクラス */
public class TreeNode(int? x) {
    public int? val = x;    // ノード値
    public int height;      // ノードの高さ
    public TreeNode? left;  // 左子ノードへの参照
    public TreeNode? right; // 右子ノードへの参照

    // シリアライズの符号化規則は以下を参照:
    // https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    // 二分木の配列表現:
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // 二分木の連結リスト表現:
    // /——— 15
    // /——— 7
    // /——— 3
    // |    \——— 6
    // |        \——— 12
    // ——— 1
    // \——— 2
    // |    /——— 9
    // \——— 4
    // \——— 8

    /* リストを二分木にデシリアライズする: 再帰 */
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

    /* リストを二分木にデシリアライズする */
    public static TreeNode? ListToTree(List<int?> arr) {
        return ListToTreeDFS(arr, 0);
    }

    /* 二分木をリストにシリアライズする: 再帰 */
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

    /* 二分木をリストにシリアライズする */
    public static List<int?> TreeToList(TreeNode root) {
        List<int?> res = [];
        TreeToListDFS(root, 0, res);
        return res;
    }
}
