/**
* File: binary_search_recur.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class binary_search_recur {
    /* 이진 탐색: 문제 f(i, j) */
    int DFS(int[] nums, int target, int i, int j) {
        // 구간이 비어 있으면 목표 원소가 없다는 뜻이므로 -1을 반환한다
        if (i > j) {
            return -1;
        }
        // 중간 인덱스 m을 계산한다
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // 부분 문제 f(m+1, j)를 재귀적으로 푼다
            return DFS(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 부분 문제 f(i, m-1)를 재귀적으로 푼다
            return DFS(nums, target, i, m - 1);
        } else {
            // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
            return m;
        }
    }

    /* 이진 탐색 */
    int BinarySearch(int[] nums, int target) {
        int n = nums.Length;
        // 문제 f(0, n-1)을 푼다
        return DFS(nums, target, 0, n - 1);
    }

    [Test]
    public void Test() {
        int target = 6;
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

        // 이진 탐색(양 끝을 포함하는 닫힌 구간)
        int index = BinarySearch(nums, target);
        Console.WriteLine("목표 원소 6의 인덱스 = " + index);
    }
}
