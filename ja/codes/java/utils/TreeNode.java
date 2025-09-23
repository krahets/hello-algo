/**
 * File: TreeNode.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package utils;

import java.util.*;

/* 二分木ノードクラス */
public class TreeNode {
    public int val; // ノード値
    public int height; // ノード高さ
    public TreeNode left; // 左子ノードへの参照
    public TreeNode right; // 右子ノードへの参照

    /* コンストラクタ */
    public TreeNode(int x) {
        val = x;
    }

    // シリアライゼーション符号化ルールについては、次を参照：
    // https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    // 二分木の配列表現：
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // 二分木の連結リスト表現：
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

    /* リストを二分木にデシリアライズ：再帰的 */
    private static TreeNode listToTreeDFS(List<Integer> arr, int i) {
        if (i < 0 || i >= arr.size() || arr.get(i) == null) {
            return null;
        }
        TreeNode root = new TreeNode(arr.get(i));
        root.left = listToTreeDFS(arr, 2 * i + 1);
        root.right = listToTreeDFS(arr, 2 * i + 2);
        return root;
    }

    /* リストを二分木にデシリアライズ */
    public static TreeNode listToTree(List<Integer> arr) {
        return listToTreeDFS(arr, 0);
    }

    /* 二分木をリストにシリアライズ：再帰的 */
    private static void treeToListDFS(TreeNode root, int i, List<Integer> res) {
        if (root == null)
            return;
        while (i >= res.size()) {
            res.add(null);
        }
        res.set(i, root.val);
        treeToListDFS(root.left, 2 * i + 1, res);
        treeToListDFS(root.right, 2 * i + 2, res);
    }

    /* 二分木をリストにシリアライズ */
    public static List<Integer> treeToList(TreeNode root) {
        List<Integer> res = new ArrayList<>();
        treeToListDFS(root, 0, res);
        return res;
    }
}