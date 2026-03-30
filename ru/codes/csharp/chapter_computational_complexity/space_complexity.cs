/**
 * File: space_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class space_complexity {
    /* Функция */
    int Function() {
        // Выполнить некоторые операции
        return 0;
    }

    /* Постоянная сложность */
    void Constant(int n) {
        // Константы, переменные и объекты занимают O(1) памяти
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // Переменные в цикле занимают O(1) памяти
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Функции в цикле занимают O(1) памяти
        for (int i = 0; i < n; i++) {
            Function();
        }
    }

    /* Линейная сложность */
    void Linear(int n) {
        // Массив длины n занимает O(n) памяти
        int[] nums = new int[n];
        // Список длины n занимает O(n) памяти
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // Хеш-таблица длины n занимает O(n) памяти
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }

    /* Линейная сложность (рекурсивная реализация) */
    void LinearRecur(int n) {
        Console.WriteLine("Рекурсия n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }

    /* Квадратичная сложность */
    void Quadratic(int n) {
        // Матрица занимает O(n^2) памяти
        int[,] numMatrix = new int[n, n];
        // Двумерный список занимает O(n^2) памяти
        List<List<int>> numList = [];
        for (int i = 0; i < n; i++) {
            List<int> tmp = [];
            for (int j = 0; j < n; j++) {
                tmp.Add(0);
            }
            numList.Add(tmp);
        }
    }

    /* Квадратичная сложность (рекурсивная реализация) */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("В рекурсии n = " + n + ", длина nums = " + nums.Length);
        return QuadraticRecur(n - 1);
    }

    /* Экспоненциальная сложность (построение полного двоичного дерева) */
    TreeNode? BuildTree(int n) {
        if (n == 0) return null;
        TreeNode root = new(0) {
            left = BuildTree(n - 1),
            right = BuildTree(n - 1)
        };
        return root;
    }

    [Test]
    public void Test() {
        int n = 5;
        // Постоянная сложность
        Constant(n);
        // Линейная сложность
        Linear(n);
        LinearRecur(n);
        // Квадратичная сложность
        Quadratic(n);
        QuadraticRecur(n);
        // Экспоненциальная сложность
        TreeNode? root = BuildTree(n);
        PrintUtil.PrintTree(root);
    }
}
