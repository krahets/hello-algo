/**
 * File: space_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class space_complexity {
    /* 함수 */
    int Function() {
        // 몇 가지 연산을 수행한다
        return 0;
    }

    /* 상수 차수 */
    void Constant(int n) {
        // 상수, 변수, 객체는 O(1) 공간을 차지한다
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // 반복문 안의 변수는 O(1) 공간을 차지한다
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 반복문 안의 함수는 O(1) 공간을 차지한다
        for (int i = 0; i < n; i++) {
            Function();
        }
    }

    /* 선형 차수 */
    void Linear(int n) {
        // 길이가 n인 배열은 O(n) 공간을 차지한다
        int[] nums = new int[n];
        // 길이가 n인 리스트는 O(n) 공간을 차지한다
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }

    /* 선형 차수(재귀 구현) */
    void LinearRecur(int n) {
        Console.WriteLine("재귀 n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }

    /* 제곱 차수 */
    void Quadratic(int n) {
        // 행렬은 O(n^2) 공간을 차지한다
        int[,] numMatrix = new int[n, n];
        // 이차원 리스트는 O(n^2) 공간을 차지한다
        List<List<int>> numList = [];
        for (int i = 0; i < n; i++) {
            List<int> tmp = [];
            for (int j = 0; j < n; j++) {
                tmp.Add(0);
            }
            numList.Add(tmp);
        }
    }

    /* 제곱 차수(재귀 구현) */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("재귀 n = " + n + " 일 때 nums의 길이 = " + nums.Length);
        return QuadraticRecur(n - 1);
    }

    /* 지수 차수(포화 이진 트리 구성) */
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
        // 상수 차수
        Constant(n);
        // 선형 차수
        Linear(n);
        LinearRecur(n);
        // 제곱 차수
        Quadratic(n);
        QuadraticRecur(n);
        // 지수 차수
        TreeNode? root = BuildTree(n);
        PrintUtil.PrintTree(root);
    }
}
