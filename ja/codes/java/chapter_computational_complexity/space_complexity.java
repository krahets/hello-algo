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
        // 何らかの操作を実行
        return 0;
    }

    /* 定数計算量 */
    static void constant(int n) {
        // 定数、変数、オブジェクトは O(1) 空間を占める
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // ループ内の変数は O(1) 空間を占める
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // ループ内の関数は O(1) 空間を占める
        for (int i = 0; i < n; i++) {
            function();
        }
    }

    /* 線形計算量 */
    static void linear(int n) {
        // 長さ n の配列は O(n) 空間を占める
        int[] nums = new int[n];
        // 長さ n のリストは O(n) 空間を占める
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // 長さ n のハッシュテーブルは O(n) 空間を占める
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }

    /* 線形計算量（再帰実装） */
    static void linearRecur(int n) {
        System.out.println("再帰 n = " + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }

    /* 二次計算量 */
    static void quadratic(int n) {
        // 行列は O(n^2) 空間を占める
        int[][] numMatrix = new int[n][n];
        // 二次元リストは O(n^2) 空間を占める
        List<List<Integer>> numList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<Integer> tmp = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                tmp.add(0);
            }
            numList.add(tmp);
        }
    }

    /* 二次計算量（再帰実装） */
    static int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        // 配列 nums の長さ = n, n-1, ..., 2, 1
        int[] nums = new int[n];
        System.out.println("再帰 n = " + n + " の nums の長さ = " + nums.length);
        return quadraticRecur(n - 1);
    }

    /* 指数計算量（完全二分木の構築） */
    static TreeNode buildTree(int n) {
        if (n == 0)
            return null;
        TreeNode root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }

    /* ドライバーコード */
    public static void main(String[] args) {
        int n = 5;
        // 定数計算量
        constant(n);
        // 線形計算量
        linear(n);
        linearRecur(n);
        // 二次計算量
        quadratic(n);
        quadraticRecur(n);
        // 指数計算量
        TreeNode root = buildTree(n);
        PrintUtil.printTree(root);
    }
}