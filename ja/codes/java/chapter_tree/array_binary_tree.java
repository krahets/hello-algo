/**
 * File: array_binary_tree.java
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

/* 配列ベースの二分木クラス */
class ArrayBinaryTree {
    private List<Integer> tree;

    /* コンストラクタ */
    public ArrayBinaryTree(List<Integer> arr) {
        tree = new ArrayList<>(arr);
    }

    /* リストの容量 */
    public int size() {
        return tree.size();
    }

    /* インデックス i のノードの値を取得 */
    public Integer val(int i) {
        // インデックスが範囲外の場合、null を返す（空の位置を表す）
        if (i < 0 || i >= size())
            return null;
        return tree.get(i);
    }

    /* インデックス i のノードの左の子のインデックスを取得 */
    public Integer left(int i) {
        return 2 * i + 1;
    }

    /* インデックス i のノードの右の子のインデックスを取得 */
    public Integer right(int i) {
        return 2 * i + 2;
    }

    /* インデックス i のノードの親のインデックスを取得 */
    public Integer parent(int i) {
        return (i - 1) / 2;
    }

    /* レベル順走査 */
    public List<Integer> levelOrder() {
        List<Integer> res = new ArrayList<>();
        // 配列を走査
        for (int i = 0; i < size(); i++) {
            if (val(i) != null)
                res.add(val(i));
        }
        return res;
    }

    /* 深さ優先走査 */
    private void dfs(Integer i, String order, List<Integer> res) {
        // 空の位置の場合、戻る
        if (val(i) == null)
            return;
        // 前順走査
        if ("pre".equals(order))
            res.add(val(i));
        dfs(left(i), order, res);
        // 中順走査
        if ("in".equals(order))
            res.add(val(i));
        dfs(right(i), order, res);
        // 後順走査
        if ("post".equals(order))
            res.add(val(i));
    }

    /* 前順走査 */
    public List<Integer> preOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "pre", res);
        return res;
    }

    /* 中順走査 */
    public List<Integer> inOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "in", res);
        return res;
    }

    /* 後順走査 */
    public List<Integer> postOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    public static void main(String[] args) {
        // 二分木を初期化
        // 特定の関数を使用して配列を二分木に変換
        List<Integer> arr = Arrays.asList(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15);

        TreeNode root = TreeNode.listToTree(arr);
        System.out.println("\n二分木を初期化\n");
        System.out.println("二分木の配列表現:");
        System.out.println(arr);
        System.out.println("二分木の連結リスト表現:");
        PrintUtil.printTree(root);

        // 配列ベースの二分木クラス
        ArrayBinaryTree abt = new ArrayBinaryTree(arr);

        // ノードにアクセス
        int i = 1;
        Integer l = abt.left(i);
        Integer r = abt.right(i);
        Integer p = abt.parent(i);
        System.out.println("\n現在のノードのインデックスは " + i + "、値 = " + abt.val(i));
        System.out.println("その左の子のインデックスは " + l + "、値 = " + (l == null ? "null" : abt.val(l)));
        System.out.println("その右の子のインデックスは " + r + "、値 = " + (r == null ? "null" : abt.val(r)));
        System.out.println("その親のインデックスは " + p + "、値 = " + (p == null ? "null" : abt.val(p)));

        // 木を走査
        List<Integer> res = abt.levelOrder();
        System.out.println("\nレベル順走査は:" + res);
        res = abt.preOrder();
        System.out.println("前順走査は:" + res);
        res = abt.inOrder();
        System.out.println("中順走査は:" + res);
        res = abt.postOrder();
        System.out.println("後順走査は:" + res);
    }
}