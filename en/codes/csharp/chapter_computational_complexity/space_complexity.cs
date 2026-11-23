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

    /* Constant complexity */
    void Constant(int n) {
        // Constants, variables, and objects occupy O(1) space
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // Variables in the loop occupy O(1) space
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Function calls in the loop occupy O(1) space
        for (int i = 0; i < n; i++) {
            Function();
        }
    }

    /* Linear complexity */
    void Linear(int n) {
        // An array of length n uses O(n) space
        int[] nums = new int[n];
        // A list of length n occupies O(n) space
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // A hash table with n entries occupies O(n) space
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }

    /* Linear complexity (recursive implementation) */
    void LinearRecur(int n) {
        Console.WriteLine("Recursive call: n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }

    /* Quadratic complexity */
    void Quadratic(int n) {
        // The matrix uses O(n^2) space
        int[,] numMatrix = new int[n, n];
        // The two-dimensional list occupies O(n^2) space
        List<List<int>> numList = [];
        for (int i = 0; i < n; i++) {
            List<int> tmp = [];
            for (int j = 0; j < n; j++) {
                tmp.Add(0);
            }
            numList.Add(tmp);
        }
    }

    /* Quadratic complexity (recursive implementation) */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("Recursive call: n = " + n + " with nums length = " + nums.Length);
        return QuadraticRecur(n - 1);
    }

    /* Exponential complexity (building a perfect binary tree) */
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
        // Constant complexity
        Constant(n);
        // Linear complexity
        Linear(n);
        LinearRecur(n);
        // Quadratic complexity
        Quadratic(n);
        QuadraticRecur(n);
        // Exponential complexity
        TreeNode? root = BuildTree(n);
        PrintUtil.PrintTree(root);
    }
}
