/**
 * File: space_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import utils.*;
import java.util.*;

public class space_complexity {
    /* 関数 */
    static int function() {
        // 何らかの処理を行う
        return 0;
    }

    /* 定数オーダー */
    static void constant(int n) {
        // 定数・変数・オブジェクトが使う領域は O(1)
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // ループ内の変数が使う領域は O(1)
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // ループ内の関数が使う領域は O(1)
        for (int i = 0; i < n; i++) {
            function();
        }
    }

    /* 線形オーダー */
    static void linear(int n) {
        // 長さ n の配列が使う領域は O(n)
        int[] nums = new int[n];
        // 長さ n のリストが使う領域は O(n)
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // 長さ n のハッシュテーブルが使う領域は O(n)
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }

    /* 線形オーダー（再帰による実装） */
    static void linearRecur(int n) {
        System.out.println("再帰 n = " + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }

    /* 二次オーダー */
    static void quadratic(int n) {
        // 行列が使う領域は O(n^2)
        int[][] numMatrix = new int[n][n];
        // 二次元リストが使う領域は O(n^2)
        List<List<Integer>> numList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<Integer> tmp = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                tmp.add(0);
            }
            numList.add(tmp);
        }
    }

    /* 二次オーダー（再帰による実装） */
    static int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        // 配列 nums の長さは順に n, n-1, ..., 2, 1
        int[] nums = new int[n];
        System.out.println("再帰 n = " + n + " での nums の長さ = " + nums.length);
        return quadraticRecur(n - 1);
    }

    /* 指数オーダー（すべての葉が同じ深さの完全二分木を構築） */
    static TreeNode buildTree(int n) {
        if (n == 0)
            return null;
        TreeNode root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }

    /* 実行例 */
    public static void main(String[] args) {
        int n = 5;
        // 定数オーダー
        constant(n);
        // 線形オーダー
        linear(n);
        linearRecur(n);
        // 二次オーダー
        quadratic(n);
        quadraticRecur(n);
        // 指数オーダー
        TreeNode root = buildTree(n);
        PrintUtil.printTree(root);
    }
}
