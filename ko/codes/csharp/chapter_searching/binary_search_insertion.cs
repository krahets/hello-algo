/**
* File: binary_search_insertion.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_insertion {
    /* 삽입 위치의 이진 탐색(중복 원소 없음) */
    public static int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                return m; // target을 찾았으므로 삽입 위치 m을 반환한다
            }
        }
        // target을 찾지 못했으므로 삽입 위치 i를 반환한다
        return i;
    }

    /* 삽입 위치의 이진 탐색(중복 원소 있음) */
    public static int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                j = m - 1; // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
            }
        }
        // 삽입 위치 i를 반환한다
        return i;
    }

    [Test]
    public void Test() {
        // 중복 원소가 없는 배열
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
        Console.WriteLine("\n배열 nums = " + nums.PrintList());
        // 삽입 위치의 이진 탐색
        foreach (int target in new int[] { 6, 9 }) {
            int index = BinarySearchInsertionSimple(nums, target);
            Console.WriteLine("원소 " + target + " ; 삽입 위치의 인덱스: " + index);
        }

        // 중복 원소를 포함하는 배열
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\n배열 nums = " + nums.PrintList());
        // 삽입 위치의 이진 탐색
        foreach (int target in new int[] { 2, 6, 20 }) {
            int index = BinarySearchInsertion(nums, target);
            Console.WriteLine("원소 " + target + " ; 삽입 위치의 인덱스: " + index);
        }
    }
}
