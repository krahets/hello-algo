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

    /* Константная сложность */
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
        // Функция в цикле занимает O(1) памяти
        for (int i = 0; i < n; i++) {
            Function();
        }
    }

    /* Линейная сложность */
    void Linear(int n) {
        // Массив длины n занимает пространство O(n)
        int[] nums = new int[n];
        // Список длины n занимает пространство O(n)
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // Хеш-таблица длины n занимает пространство O(n)
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }

    /* Линейная сложность (рекурсивная реализация) */
    void LinearRecur(int n) {
        Console.WriteLine("рекурсия n =" + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }

    /* Квадратичная сложность */
    void Quadratic(int n) {
        // Матрица занимает пространство O(n^2)
        int[,] numMatrix = new int[n, n];
        // Двумерный список занимает пространство O(n^2)
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
        Console.WriteLine("рекурсия n =" + n + "в nums длина =" + nums.Length);
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
        // Константная сложность
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
