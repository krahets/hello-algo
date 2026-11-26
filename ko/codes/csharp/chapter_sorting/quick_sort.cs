/**
 * File: quick_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

class quickSort {
    /* 원소 교환 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 양방향 포인터로 분할 */
    static int Partition(int[] nums, int left, int right) {
        // nums[left]를 피벗으로 선택
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left])
                i++;          // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            Swap(nums, i, j); // 두 원소 교환
        }
        Swap(nums, i, left);  // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i;             // 피벗의 인덱스 반환
    }

    /* 퀵 정렬 */
    public static void QuickSort(int[] nums, int left, int right) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if (left >= right)
            return;
        // 양방향 포인터로 분할
        int pivot = Partition(nums, left, right);
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* 퀵 정렬 클래스(중앙값 피벗 최적화) */
class QuickSortMedian {
    /* 원소 교환 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 세 후보 원소의 중앙값 선택 */
    static int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m이 l과 r 사이에 있음
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l이 m과 r 사이에 있음
        return right;
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    static int Partition(int[] nums, int left, int right) {
        // 세 후보 원소의 중앙값 선택
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        Swap(nums, left, med);
        // nums[left]를 피벗으로 선택
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left])
                i++;          // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            Swap(nums, i, j); // 두 원소 교환
        }
        Swap(nums, i, left);  // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i;             // 피벗의 인덱스 반환
    }

    /* 퀵 정렬 */
    public static void QuickSort(int[] nums, int left, int right) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if (left >= right)
            return;
        // 양방향 포인터로 분할
        int pivot = Partition(nums, left, right);
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* 퀵 정렬 클래스(재귀 깊이 최적화) */
class QuickSortTailCall {
    /* 원소 교환 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 양방향 포인터로 분할 */
    static int Partition(int[] nums, int left, int right) {
        // nums[left]를 피벗으로 선택
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left])
                i++;          // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            Swap(nums, i, j); // 두 원소 교환
        }
        Swap(nums, i, left);  // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i; // 피벗의 인덱스 반환
    }

    /* 퀵 정렬(재귀 깊이 최적화) */
    public static void QuickSort(int[] nums, int left, int right) {
        // 부분 배열의 길이가 1이면 종료
        while (left < right) {
            // 양방향 포인터로 분할
            int pivot = Partition(nums, left, right);
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1;  // 남은 미정렬 구간은 [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1; // 남은 미정렬 구간은 [left, pivot - 1]
            }
        }
    }
}

public class quick_sort {
    [Test]
    public void Test() {
        /* 퀵 정렬 */
        int[] nums = [2, 4, 1, 0, 3, 5];
        quickSort.QuickSort(nums, 0, nums.Length - 1);
        Console.WriteLine("퀵 정렬 후 nums = " + string.Join(",", nums));

        /* 퀵 정렬(중앙값 피벗 최적화) */
        int[] nums1 = [2, 4, 1, 0, 3, 5];
        QuickSortMedian.QuickSort(nums1, 0, nums1.Length - 1);
        Console.WriteLine("퀵 정렬(중앙값 피벗 최적화) 후 nums1 = " + string.Join(",", nums1));

        /* 퀵 정렬(재귀 깊이 최적화) */
        int[] nums2 = [2, 4, 1, 0, 3, 5];
        QuickSortTailCall.QuickSort(nums2, 0, nums2.Length - 1);
        Console.WriteLine("퀵 정렬(재귀 깊이 최적화) 후 nums2 = " + string.Join(",", nums2));
    }
}
