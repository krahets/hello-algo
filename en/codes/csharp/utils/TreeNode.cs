/**
 * File: TreeNode.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.utils;

/* Binary Tree Node Class */
public class TreeNode(int? x) {
    public int? val = x;    // Node value
    public int height;      // Node height
    public TreeNode? left;  // Left child node reference
    public TreeNode? right; // Right child node reference

    // For serialization encoding rules, please refer to:
    // https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    // Array representation of binary tree:
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // Linked list representation of binary tree:
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

    /* Deserialize list to binary tree: recursive */
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

    /* Deserialize list to binary tree */
    public static TreeNode? ListToTree(List<int?> arr) {
        return ListToTreeDFS(arr, 0);
    }

    /* Serialize binary tree to list: recursive */
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

    /* Serialize binary tree to list */
    public static List<int?> TreeToList(TreeNode root) {
        List<int?> res = [];
        TreeToListDFS(root, 0, res);
        return res;
    }
}
