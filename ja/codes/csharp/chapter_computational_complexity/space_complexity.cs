/**
 * File: space_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class space_complexity {
    /* 関数 */
    int Function() {
        // 何らかの処理を行う
        return 0;
    }

    /* 定数階 */
    void Constant(int n) {
        // 定数、変数、オブジェクトは O(1) の空間を占める
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // ループ内の変数は O(1) の空間を占める
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // ループ内の関数は O(1) の空間を占める
        for (int i = 0; i < n; i++) {
            Function();
        }
    }

    /* 線形階 */
    void Linear(int n) {
        // 長さ n の配列は O(n) の空間を使用
        int[] nums = new int[n];
        // 長さ n のリストは O(n) の空間を使用
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // 長さ n のハッシュテーブルは O(n) の空間を使用
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }

    /* 線形時間（再帰実装） */
    void LinearRecur(int n) {
        Console.WriteLine("再帰 n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }

    /* 二乗階 */
    void Quadratic(int n) {
        // 行列は O(n^2) の空間を使用する
        int[,] numMatrix = new int[n, n];
        // 二次元リストは O(n^2) の空間を使用
        List<List<int>> numList = [];
        for (int i = 0; i < n; i++) {
            List<int> tmp = [];
            for (int j = 0; j < n; j++) {
                tmp.Add(0);
            }
            numList.Add(tmp);
        }
    }

    /* 二次時間（再帰実装） */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("再帰 n = " + n + " における nums の長さ = " + nums.Length);
        return QuadraticRecur(n - 1);
    }

    /* 指数時間（完全二分木の構築） */
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
        // 定数階
        Constant(n);
        // 線形階
        Linear(n);
        LinearRecur(n);
        // 二乗階
        Quadratic(n);
        QuadraticRecur(n);
        // 指数オーダー
        TreeNode? root = BuildTree(n);
        PrintUtil.PrintTree(root);
    }
}
