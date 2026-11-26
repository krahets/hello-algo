/**
 * File: TreeNode.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package utils;

import java.util.*;

/* 二分木のノードを表すクラス */
public class TreeNode {
    public int val; // ノードの値
    public int height; // ノードの高さ
    public TreeNode left; // 左の子ノードへの参照
    public TreeNode right; // 右の子ノードへの参照

    /* コンストラクタ */
    public TreeNode(int x) {
        val = x;
    }

    // シリアライズ時の符号化規則は以下を参照
    // https://www.hello-algo.com/ja/chapter_tree/array_representation_of_tree/
    // 二分木の配列表現：
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // 二分木の連結表現：
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

    /* リストをデシリアライズして二分木を復元する（再帰） */
    private static TreeNode listToTreeDFS(List<Integer> arr, int i) {
        if (i < 0 || i >= arr.size() || arr.get(i) == null) {
            return null;
        }
        TreeNode root = new TreeNode(arr.get(i));
        root.left = listToTreeDFS(arr, 2 * i + 1);
        root.right = listToTreeDFS(arr, 2 * i + 2);
        return root;
    }

    /* リストをデシリアライズして二分木を復元する */
    public static TreeNode listToTree(List<Integer> arr) {
        return listToTreeDFS(arr, 0);
    }

    /* 二分木をリストにシリアライズする（再帰） */
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

    /* 二分木をリストにシリアライズする */
    public static List<Integer> treeToList(TreeNode root) {
        List<Integer> res = new ArrayList<>();
        treeToListDFS(root, 0, res);
        return res;
    }
}
