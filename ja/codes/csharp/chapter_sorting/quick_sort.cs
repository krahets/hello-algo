/**
 * File: quick_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

class quickSort {
    /* 要素を交換 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 左右から走査して分割 */
    static int Partition(int[] nums, int left, int right) {
        // nums[left] をピボットとする
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 右から左へ走査し、ピボットより小さい最初の要素を探す
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へ走査し、ピボットより大きい最初の要素を探す
            Swap(nums, i, j); // この 2 要素を交換
        }
        Swap(nums, i, left);  // ピボットを交換して左右の部分配列の境界に移す
        return i;             // ピボットのインデックスを返す
    }

    /* クイックソート */
    public static void QuickSort(int[] nums, int left, int right) {
        // 部分配列の長さが 1 になったら再帰を終了
        if (left >= right)
            return;
        // 左右から走査して分割
        int pivot = Partition(nums, left, right);
        // 左右の部分配列を再帰的に処理
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* クイックソートクラス（中央値をピボットに使用） */
class QuickSortMedian {
    /* 要素を交換 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 3 つの候補の中央値を選ぶ */
    static int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m の値は l と r の値の間にある
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l の値は m と r の値の間にある
        return right;
    }

    /* 左右から走査して分割（3 要素の中央値を使用） */
    static int Partition(int[] nums, int left, int right) {
        // 3 つの候補の中央値を選ぶ
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // 中央値の要素を配列の左端に移す
        Swap(nums, left, med);
        // nums[left] をピボットとする
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 右から左へ走査し、ピボットより小さい最初の要素を探す
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へ走査し、ピボットより大きい最初の要素を探す
            Swap(nums, i, j); // この 2 要素を交換
        }
        Swap(nums, i, left);  // ピボットを交換して左右の部分配列の境界に移す
        return i;             // ピボットのインデックスを返す
    }

    /* クイックソート */
    public static void QuickSort(int[] nums, int left, int right) {
        // 部分配列の長さが 1 になったら再帰を終了
        if (left >= right)
            return;
        // 左右から走査して分割
        int pivot = Partition(nums, left, right);
        // 左右の部分配列を再帰的に処理
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* クイックソートクラス（再帰の深さを最適化） */
class QuickSortTailCall {
    /* 要素を交換 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 左右から走査して分割 */
    static int Partition(int[] nums, int left, int right) {
        // nums[left] をピボットとする
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 右から左へ走査し、ピボットより小さい最初の要素を探す
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へ走査し、ピボットより大きい最初の要素を探す
            Swap(nums, i, j); // この 2 要素を交換
        }
        Swap(nums, i, left);  // ピボットを交換して左右の部分配列の境界に移す
        return i; // ピボットのインデックスを返す
    }

    /* クイックソート（再帰の深さを最適化） */
    public static void QuickSort(int[] nums, int left, int right) {
        // 部分配列の長さが 1 になったら終了
        while (left < right) {
            // 左右から走査して分割
            int pivot = Partition(nums, left, right);
            // 短いほうの部分配列にクイックソートを適用
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // 左の部分配列を再帰的にソート
                left = pivot + 1;  // 残りの未整列区間は [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // 右の部分配列を再帰的にソート
                right = pivot - 1; // 残りの未整列区間は [left, pivot - 1]
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
        Console.WriteLine("クイックソート後の nums = " + string.Join(",", nums));

        /* クイックソート（中央値をピボットに使用） */
        int[] nums1 = [2, 4, 1, 0, 3, 5];
        QuickSortMedian.QuickSort(nums1, 0, nums1.Length - 1);
        Console.WriteLine("クイックソート（中央値をピボットに使用）後の nums1 = " + string.Join(",", nums1));

        /* クイックソート（再帰の深さを最適化） */
        int[] nums2 = [2, 4, 1, 0, 3, 5];
        QuickSortTailCall.QuickSort(nums2, 0, nums2.Length - 1);
        Console.WriteLine("クイックソート（再帰の深さを最適化）後の nums2 = " + string.Join(",", nums2));
    }
}
