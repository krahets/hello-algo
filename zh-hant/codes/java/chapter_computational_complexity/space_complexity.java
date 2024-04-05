/**
 * File: space_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import utils.*;
import java.util.*;

public class space_complexity {
    /* 函式 */
    static int function() {
        // 執行某些操作
        return 0;
    }

    /* 常數階 */
    static void constant(int n) {
        // 常數、變數、物件佔用 O(1) 空間
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // 迴圈中的變數佔用 O(1) 空間
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 迴圈中的函式佔用 O(1) 空間
        for (int i = 0; i < n; i++) {
            function();
        }
    }

    /* 線性階 */
    static void linear(int n) {
        // 長度為 n 的陣列佔用 O(n) 空間
        int[] nums = new int[n];
        // 長度為 n 的串列佔用 O(n) 空間
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // 長度為 n 的雜湊表佔用 O(n) 空間
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }

    /* 線性階（遞迴實現） */
    static void linearRecur(int n) {
        System.out.println("遞迴 n = " + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }

    /* 平方階 */
    static void quadratic(int n) {
        // 矩陣佔用 O(n^2) 空間
        int[][] numMatrix = new int[n][n];
        // 二維串列佔用 O(n^2) 空間
        List<List<Integer>> numList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<Integer> tmp = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                tmp.add(0);
            }
            numList.add(tmp);
        }
    }

    /* 平方階（遞迴實現） */
    static int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        // 陣列 nums 長度為 n, n-1, ..., 2, 1
        int[] nums = new int[n];
        System.out.println("遞迴 n = " + n + " 中的 nums 長度 = " + nums.length);
        return quadraticRecur(n - 1);
    }

    /* 指數階（建立滿二元樹） */
    static TreeNode buildTree(int n) {
        if (n == 0)
            return null;
        TreeNode root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }

    /* Driver Code */
    public static void main(String[] args) {
        int n = 5;
        // 常數階
        constant(n);
        // 線性階
        linear(n);
        linearRecur(n);
        // 平方階
        quadratic(n);
        quadraticRecur(n);
        // 指數階
        TreeNode root = buildTree(n);
        PrintUtil.printTree(root);
    }
}
