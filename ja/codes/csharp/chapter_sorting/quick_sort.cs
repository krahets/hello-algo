/**
 * File: quick_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

class quickSort {
    /* 要素の交換 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 番兵を用いた分割 */
    static int Partition(int[] nums, int left, int right) {
        // nums[left] をピボットとする
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 右から左へ、ピボットより小さい最初の要素を探す
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へ、ピボットより大きい最初の要素を探す
            Swap(nums, i, j); // この 2 つの要素を交換する
        }
        Swap(nums, i, left);  // ピボットを 2 つの部分配列の境界に移す
        return i;             // ピボットのインデックスを返す
    }

    /* クイックソート */
    public static void QuickSort(int[] nums, int left, int right) {
        // 部分配列の長さが 1 になったら再帰を終了する
        if (left >= right)
            return;
        // 番兵を用いた分割
        int pivot = Partition(nums, left, right);
        // 左部分配列と右部分配列を再帰的に処理する
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* クイックソートクラス（中央値ピボットによる最適化） */
class QuickSortMedian {
    /* 要素の交換 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 候補となる 3 要素の中央値を選ぶ */
    static int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m が l と r の間にある
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l が m と r の間にある
        return right;
    }

    /* 番兵を用いた分割（3 値の中央値を選択） */
    static int Partition(int[] nums, int left, int right) {
        // 候補となる 3 要素の中央値を選ぶ
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // 中央値を配列の左端に移す
        Swap(nums, left, med);
        // nums[left] をピボットとする
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 右から左へ、ピボットより小さい最初の要素を探す
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へ、ピボットより大きい最初の要素を探す
            Swap(nums, i, j); // この 2 つの要素を交換する
        }
        Swap(nums, i, left);  // ピボットを 2 つの部分配列の境界に移す
        return i;             // ピボットのインデックスを返す
    }

    /* クイックソート */
    public static void QuickSort(int[] nums, int left, int right) {
        // 部分配列の長さが 1 になったら再帰を終了する
        if (left >= right)
            return;
        // 番兵を用いた分割
        int pivot = Partition(nums, left, right);
        // 左部分配列と右部分配列を再帰的に処理する
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* クイックソートクラス（再帰の深さの最適化） */
class QuickSortTailCall {
    /* 要素の交換 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 番兵を用いた分割 */
    static int Partition(int[] nums, int left, int right) {
        // nums[left] をピボットとする
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 右から左へ、ピボットより小さい最初の要素を探す
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へ、ピボットより大きい最初の要素を探す
            Swap(nums, i, j); // この 2 つの要素を交換する
        }
        Swap(nums, i, left);  // ピボットを 2 つの部分配列の境界に移す
        return i; // ピボットのインデックスを返す
    }

    /* クイックソート（再帰の深さの最適化） */
    public static void QuickSort(int[] nums, int left, int right) {
        // 部分配列の長さが 1 になったら終了する
        while (left < right) {
            // 番兵を用いた分割操作
            int pivot = Partition(nums, left, right);
            // 2 つの部分配列のうち短いほうにクイックソートを適用する
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // 左部分配列を再帰的にソートする
                left = pivot + 1;  // 残りの未ソート区間は [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // 右部分配列を再帰的にソートする
                right = pivot - 1; // 残りの未ソート区間は [left, pivot - 1]
            }
        }
    }
}

public class quick_sort {
    [Test]
    public void Test() {
        /* クイックソート */
        int[] nums = [2, 4, 1, 0, 3, 5];
        quickSort.QuickSort(nums, 0, nums.Length - 1);
        Console.WriteLine("クイックソート完了後 nums = " + string.Join(",", nums));

        /* クイックソート（中央値ピボットによる最適化） */
        int[] nums1 = [2, 4, 1, 0, 3, 5];
        QuickSortMedian.QuickSort(nums1, 0, nums1.Length - 1);
        Console.WriteLine("クイックソート（中央値ピボットによる最適化）の完了後 nums1 = " + string.Join(",", nums1));

        /* クイックソート（再帰の深さの最適化） */
        int[] nums2 = [2, 4, 1, 0, 3, 5];
        QuickSortTailCall.QuickSort(nums2, 0, nums2.Length - 1);
        Console.WriteLine("クイックソート（再帰の深さの最適化）の完了後 nums2 = " + string.Join(",", nums2));
    }
}
