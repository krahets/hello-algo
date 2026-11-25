/**
* File: binary_search_insertion.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_insertion {
    /* 이진 탐색으로 삽입 위치 찾기(중복 원소가 없는 경우) */
    public static int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 닫힌구간 [0, n-1]을 초기화한다.
        while (i <= j) {
            int m = i + (j - i) / 2; // 중점 인덱스 m을 계산한다.
            if (nums[m] < target) {
                i = m + 1; // target을 찾을 구간은 [m+1, j]이다.
            } else if (nums[m] > target) {
                j = m - 1; // target을 찾을 구간은 [i, m-1]이다.
            } else {
                return m; // target을 찾았으므로 삽입 위치 m을 반환한다.
            }
        }
        // target을 찾지 못했으므로 삽입 위치 i를 반환한다.
        return i;
    }

    /* 이진 탐색으로 삽입 위치 찾기(중복 원소가 있는 경우) */
    public static int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 닫힌구간 [0, n-1]을 초기화한다.
        while (i <= j) {
            int m = i + (j - i) / 2; // 중점 인덱스 m을 계산한다.
            if (nums[m] < target) {
                i = m + 1; // target을 찾을 구간은 [m+1, j]이다.
            } else if (nums[m] > target) {
                j = m - 1; // target을 찾을 구간은 [i, m-1]이다.
            } else {
                j = m - 1; // target보다 작은 원소 중 가장 오른쪽 원소를 찾을 구간은 [i, m-1]이다.
            }
        }
        // 삽입 위치 i를 반환한다.
        return i;
    }

    [Test]
    public void Test() {
        // 중복 원소가 없는 배열
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
        Console.WriteLine("\n배열 nums = " + nums.PrintList());
        // 이진 탐색으로 삽입 위치 찾기
        foreach (int target in new int[] { 6, 9 }) {
            int index = BinarySearchInsertionSimple(nums, target);
            Console.WriteLine("삽입할 값 = " + target + " | 삽입 인덱스 = " + index);
        }

        // 중복 원소가 있는 배열
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\n배열 nums = " + nums.PrintList());
        // 이진 탐색으로 삽입 위치 찾기
        foreach (int target in new int[] { 2, 6, 20 }) {
            int index = BinarySearchInsertion(nums, target);
            Console.WriteLine("삽입할 값 = " + target + " | 삽입 인덱스 = " + index);
        }
    }
}
