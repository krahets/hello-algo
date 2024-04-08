/**
 * File: space_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class space_complexity {
    /* 函式 */
    int Function() {
        // 執行某些操作
        return 0;
    }

    /* 常數階 */
    void Constant(int n) {
        // 常數、變數、物件佔用 O(1) 空間
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // 迴圈中的變數佔用 O(1) 空間
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 迴圈中的函式佔用 O(1) 空間
        for (int i = 0; i < n; i++) {
            Function();
        }
    }

    /* 線性階 */
    void Linear(int n) {
        // 長度為 n 的陣列佔用 O(n) 空間
        int[] nums = new int[n];
        // 長度為 n 的串列佔用 O(n) 空間
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // 長度為 n 的雜湊表佔用 O(n) 空間
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }

    /* 線性階（遞迴實現） */
    void LinearRecur(int n) {
        Console.WriteLine("遞迴 n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }

    /* 平方階 */
    void Quadratic(int n) {
        // 矩陣佔用 O(n^2) 空間
        int[,] numMatrix = new int[n, n];
        // 二維串列佔用 O(n^2) 空間
        List<List<int>> numList = [];
        for (int i = 0; i < n; i++) {
            List<int> tmp = [];
            for (int j = 0; j < n; j++) {
                tmp.Add(0);
            }
            numList.Add(tmp);
        }
    }

    /* 平方階（遞迴實現） */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("遞迴 n = " + n + " 中的 nums 長度 = " + nums.Length);
        return QuadraticRecur(n - 1);
    }

    /* 指數階（建立滿二元樹） */
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
        // 常數階
        Constant(n);
        // 線性階
        Linear(n);
        LinearRecur(n);
        // 平方階
        Quadratic(n);
        QuadraticRecur(n);
        // 指數階
        TreeNode? root = BuildTree(n);
        PrintUtil.PrintTree(root);
    }
}
