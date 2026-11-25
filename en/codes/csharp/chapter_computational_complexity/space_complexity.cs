/**
 * File: space_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class space_complexity {
    /* Function */
    int Function() {
        // Perform some operations
        return 0;
    }

    /* Constant space */
    void Constant(int n) {
        // Constants, variables, and objects use O(1) space
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // Variables in the loop use O(1) space
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Function calls in the loop use O(1) space
        for (int i = 0; i < n; i++) {
            Function();
        }
    }

    /* Linear space */
    void Linear(int n) {
        // An array of length n uses O(n) space
        int[] nums = new int[n];
        // A list of length n uses O(n) space
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // A hash table with n entries uses O(n) space
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }

    /* Linear space (recursive) */
    void LinearRecur(int n) {
        Console.WriteLine("Recursive call: n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }

    /* Quadratic space */
    void Quadratic(int n) {
        // A matrix uses O(n^2) space
        int[,] numMatrix = new int[n, n];
        // A two-dimensional list uses O(n^2) space
        List<List<int>> numList = [];
        for (int i = 0; i < n; i++) {
            List<int> tmp = [];
            for (int j = 0; j < n; j++) {
                tmp.Add(0);
            }
            numList.Add(tmp);
        }
    }

    /* Quadratic space (recursive) */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("Recursive call: n = " + n + " with length of nums = " + nums.Length);
        return QuadraticRecur(n - 1);
    }

    /* Exponential space (build a perfect binary tree) */
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
        // Constant space
        Constant(n);
        // Linear space
        Linear(n);
        LinearRecur(n);
        // Quadratic space
        Quadratic(n);
        QuadraticRecur(n);
        // Exponential space
        TreeNode? root = BuildTree(n);
        PrintUtil.PrintTree(root);
    }
}
