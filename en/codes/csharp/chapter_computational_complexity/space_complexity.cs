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

    /* Constant order */
    void Constant(int n) {
        // Constants, variables, objects occupy O(1) space
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // Variables in the loop occupy O(1) space
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Functions in the loop occupy O(1) space
        for (int i = 0; i < n; i++) {
            Function();
        }
    }

    /* Linear order */
    void Linear(int n) {
        // Array of length n uses O(n) space
        int[] nums = new int[n];
        // A list of length n occupies O(n) space
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // A hash table of length n occupies O(n) space
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }

    /* Linear order (recursive implementation) */
    void LinearRecur(int n) {
        Console.WriteLine("Recursion n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }

    /* Exponential order */
    void Quadratic(int n) {
        // Matrix uses O(n^2) space
        int[,] numMatrix = new int[n, n];
        // 2D list uses O(n^2) space
        List<List<int>> numList = [];
        for (int i = 0; i < n; i++) {
            List<int> tmp = [];
            for (int j = 0; j < n; j++) {
                tmp.Add(0);
            }
            numList.Add(tmp);
        }
    }

    /* Quadratic order (recursive implementation) */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("Recursion n = " + n + ", nums length = " + nums.Length);
        return QuadraticRecur(n - 1);
    }

    /* Driver Code */
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
        // Constant order
        Constant(n);
        // Linear order
        Linear(n);
        LinearRecur(n);
        // Exponential order
        Quadratic(n);
        QuadraticRecur(n);
        // Exponential order
        TreeNode? root = BuildTree(n);
        PrintUtil.PrintTree(root);
    }
}
