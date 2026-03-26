/**
 * File: space_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import utils.*;
import java.util.*;

public class space_complexity {
    /* Функция */
    static int function() {
        // Выполнить некоторые операции
        return 0;
    }

    /* Константная сложность */
    static void constant(int n) {
        // Константы, переменные и объекты занимают O(1) памяти
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // Переменные в цикле занимают O(1) памяти
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Функция в цикле занимает O(1) памяти
        for (int i = 0; i < n; i++) {
            function();
        }
    }

    /* Линейная сложность */
    static void linear(int n) {
        // Массив длины n занимает пространство O(n)
        int[] nums = new int[n];
        // Список длины n занимает пространство O(n)
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // Хеш-таблица длины n занимает пространство O(n)
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }

    /* Линейная сложность (рекурсивная реализация) */
    static void linearRecur(int n) {
        System.out.println("рекурсия n =" + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }

    /* Квадратичная сложность */
    static void quadratic(int n) {
        // Матрица занимает пространство O(n^2)
        int[][] numMatrix = new int[n][n];
        // Двумерный список занимает пространство O(n^2)
        List<List<Integer>> numList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<Integer> tmp = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                tmp.add(0);
            }
            numList.add(tmp);
        }
    }

    /* Квадратичная сложность (рекурсивная реализация) */
    static int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        // массив nums длинаравно n, n-1,..., 2, 1
        int[] nums = new int[n];
        System.out.println("рекурсия n =" + n + "в nums длина =" + nums.length);
        return quadraticRecur(n - 1);
    }

    /* Экспоненциальная сложность (построение полного двоичного дерева) */
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
        // Константная сложность
        constant(n);
        // Линейная сложность
        linear(n);
        linearRecur(n);
        // Квадратичная сложность
        quadratic(n);
        quadraticRecur(n);
        // Экспоненциальная сложность
        TreeNode root = buildTree(n);
        PrintUtil.printTree(root);
    }
}
