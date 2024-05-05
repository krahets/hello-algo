/**
 * File: space_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import utils.*;
import java.util.*;

public class space_complexity {
    /* Function */
    static int function() {
        // Perform some operations
        return 0;
    }

    /* Constant complexity */
    static void constant(int n) {
        // Constants, variables, objects occupy O(1) space
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // Variables in a loop occupy O(1) space
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Functions in a loop occupy O(1) space
        for (int i = 0; i < n; i++) {
            function();
        }
    }

    /* Linear complexity */
    static void linear(int n) {
        // Array of length n occupies O(n) space
        int[] nums = new int[n];
        // A list of length n occupies O(n) space
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // A hash table of length n occupies O(n) space
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }

    /* Linear complexity (recursive implementation) */
    static void linearRecur(int n) {
        System.out.println("Recursion n = " + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }

    /* Quadratic complexity */
    static void quadratic(int n) {
        // Matrix occupies O(n^2) space
        int[][] numMatrix = new int[n][n];
        // A two-dimensional list occupies O(n^2) space
        List<List<Integer>> numList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<Integer> tmp = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                tmp.add(0);
            }
            numList.add(tmp);
        }
    }

    /* Quadratic complexity (recursive implementation) */
    static int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        // Array nums length = n, n-1, ..., 2, 1
        int[] nums = new int[n];
        System.out.println("Recursion n = " + n + " in the length of nums = " + nums.length);
        return quadraticRecur(n - 1);
    }

    /* Exponential complexity (building a full binary tree) */
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
        // Constant complexity
        constant(n);
        // Linear complexity
        linear(n);
        linearRecur(n);
        // Quadratic complexity
        quadratic(n);
        quadraticRecur(n);
        // Exponential complexity
        TreeNode root = buildTree(n);
        PrintUtil.printTree(root);
    }
}
