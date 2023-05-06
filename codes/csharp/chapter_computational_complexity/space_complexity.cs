/**
 * File: space_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class space_complexity {
    /* 函数 */
    static int function() {
        // do something
        return 0;
    }

    /* 常数阶 */
    static void constant(int n) {
        // 常量、变量、对象占用 O(1) 空间
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // 循环中的变量占用 O(1) 空间
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 循环中的函数占用 O(1) 空间
        for (int i = 0; i < n; i++) {
            function();
        }
    }

    /* 线性阶 */
    static void linear(int n) {
        // 长度为 n 的数组占用 O(n) 空间
        int[] nums = new int[n];
        // 长度为 n 的列表占用 O(n) 空间
        List<ListNode> nodes = new();
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // 长度为 n 的哈希表占用 O(n) 空间
        Dictionary<int, string> map = new();
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }

    /* 线性阶（递归实现） */
    static void linearRecur(int n) {
        Console.WriteLine("递归 n = " + n);
        if (n == 1) return;
        linearRecur(n - 1);
    }

    /* 平方阶 */
    static void quadratic(int n) {
        // 矩阵占用 O(n^2) 空间
        int[,] numMatrix = new int[n, n];
        // 二维列表占用 O(n^2) 空间
        List<List<int>> numList = new();
        for (int i = 0; i < n; i++) {
            List<int> tmp = new();
            for (int j = 0; j < n; j++) {
                tmp.Add(0);
            }
            numList.Add(tmp);
        }
    }

    /* 平方阶（递归实现） */
    static int quadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("递归 n = " + n + " 中的 nums 长度 = " + nums.Length);
        return quadraticRecur(n - 1);
    }

    /* 指数阶（建立满二叉树） */
    static TreeNode? buildTree(int n) {
        if (n == 0) return null;
        TreeNode root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }

    [Test]
    public void Test() {
        int n = 5;
        // 常数阶
        constant(n);
        // 线性阶
        linear(n);
        linearRecur(n);
        // 平方阶
        quadratic(n);
        quadraticRecur(n);
        // 指数阶
        TreeNode? root = buildTree(n);
        PrintUtil.PrintTree(root);
    }
}
