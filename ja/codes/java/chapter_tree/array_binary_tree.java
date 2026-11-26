/**
 * File: array_binary_tree.java
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

/* 二分木を配列で表すクラス */
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

    /* インデックス i のノードの値を取得する */
    public Integer val(int i) {
        // 範囲外なら空きを示す null を返す
        if (i < 0 || i >= size())
            return null;
        return tree.get(i);
    }

    /* インデックス i のノードの左の子のインデックスを取得する */
    public Integer left(int i) {
        return 2 * i + 1;
    }

    /* インデックス i のノードの右の子のインデックスを取得する */
    public Integer right(int i) {
        return 2 * i + 2;
    }

    /* インデックス i のノードの親のインデックスを取得する */
    public Integer parent(int i) {
        return (i - 1) / 2;
    }

    /* レベル順走査 */
    public List<Integer> levelOrder() {
        List<Integer> res = new ArrayList<>();
        // 配列を順に走査する
        for (int i = 0; i < size(); i++) {
            if (val(i) != null)
                res.add(val(i));
        }
        return res;
    }

    /* 深さ優先走査 */
    private void dfs(Integer i, String order, List<Integer> res) {
        // 空きなら戻る
        if (val(i) == null)
            return;
        // 行きがけ順走査
        if ("pre".equals(order))
            res.add(val(i));
        dfs(left(i), order, res);
        // 通りがけ順走査
        if ("in".equals(order))
            res.add(val(i));
        dfs(right(i), order, res);
        // 帰りがけ順走査
        if ("post".equals(order))
            res.add(val(i));
    }

    /* 行きがけ順走査 */
    public List<Integer> preOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "pre", res);
        return res;
    }

    /* 通りがけ順走査 */
    public List<Integer> inOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "in", res);
        return res;
    }

    /* 帰りがけ順走査 */
    public List<Integer> postOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    public static void main(String[] args) {
        // 二分木を初期化する
        // ここでは配列から直接二分木を作る関数を使う
        List<Integer> arr = Arrays.asList(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15);

        TreeNode root = TreeNode.listToTree(arr);
        System.out.println("\n二分木を初期化\n");
        System.out.println("二分木の配列表現：");
        System.out.println(arr);
        System.out.println("二分木の連結表現：");
        PrintUtil.printTree(root);

        // 二分木を配列で表すクラス
        ArrayBinaryTree abt = new ArrayBinaryTree(arr);

        // ノードへのアクセス
        int i = 1;
        Integer l = abt.left(i);
        Integer r = abt.right(i);
        Integer p = abt.parent(i);
        System.out.println("\n現在のノードのインデックスは " + i + " 、値は " + abt.val(i));
        System.out.println("左の子のインデックスは " + l + " 、値は " + (l == null ? "null" : abt.val(l)));
        System.out.println("右の子のインデックスは " + r + " 、値は " + (r == null ? "null" : abt.val(r)));
        System.out.println("親のインデックスは " + p + " 、値は " + (p == null ? "null" : abt.val(p)));

        // 木を走査する
        List<Integer> res = abt.levelOrder();
        System.out.println("\nレベル順：" + res);
        res = abt.preOrder();
        System.out.println("行きがけ順：" + res);
        res = abt.inOrder();
        System.out.println("通りがけ順：" + res);
        res = abt.postOrder();
        System.out.println("帰りがけ順：" + res);
    }
}
