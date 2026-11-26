/**
 * File: quick_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* クイックソートクラス */
class QuickSort {
  /* 要素を交換 */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* 左右から走査して分割 */
  static int _partition(List<int> nums, int left, int right) {
    // nums[left] をピボットとする
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // 右から左へ走査し、ピボットより小さい最初の要素を探す
      while (i < j && nums[i] <= nums[left]) i++; // 左から右へ走査し、ピボットより大きい最初の要素を探す
      _swap(nums, i, j); // この 2 要素を交換
    }
    _swap(nums, i, left); // ピボットを交換して左右の部分配列の境界に移す
    return i; // ピボットのインデックスを返す
  }

  /* クイックソート */
  static void quickSort(List<int> nums, int left, int right) {
    // 部分配列の長さが 1 になったら再帰を終了
    if (left >= right) return;
    // 左右から走査して分割
    int pivot = _partition(nums, left, right);
    // 左右の部分配列を再帰的に処理
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
  }
}

/* クイックソートクラス（中央値をピボットに使用） */
class QuickSortMedian {
  /* 要素を交換 */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* 3 つの候補の中央値を選ぶ */
  static int _medianThree(List<int> nums, int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
      return mid; // m の値は l と r の値の間にある
    if ((m <= l && l <= r) || (r <= l && l <= m))
      return left; // l の値は m と r の値の間にある
    return right;
  }

  /* 左右から走査して分割（3 要素の中央値を使用） */
  static int _partition(List<int> nums, int left, int right) {
    // 3 つの候補の中央値を選ぶ
    int med = _medianThree(nums, left, (left + right) ~/ 2, right);
    // 中央値の要素を配列の左端に移す
    _swap(nums, left, med);
    // nums[left] をピボットとする
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // 右から左へ走査し、ピボットより小さい最初の要素を探す
      while (i < j && nums[i] <= nums[left]) i++; // 左から右へ走査し、ピボットより大きい最初の要素を探す
      _swap(nums, i, j); // この 2 要素を交換
    }
    _swap(nums, i, left); // ピボットを交換して左右の部分配列の境界に移す
    return i; // ピボットのインデックスを返す
  }

  /* クイックソート */
  static void quickSort(List<int> nums, int left, int right) {
    // 部分配列の長さが 1 になったら再帰を終了
    if (left >= right) return;
    // 左右から走査して分割
    int pivot = _partition(nums, left, right);
    // 左右の部分配列を再帰的に処理
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
  }
}

/* クイックソートクラス（再帰の深さを最適化） */
class QuickSortTailCall {
  /* 要素を交換 */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* 左右から走査して分割 */
  static int _partition(List<int> nums, int left, int right) {
    // nums[left] をピボットとする
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // 右から左へ走査し、ピボットより小さい最初の要素を探す
      while (i < j && nums[i] <= nums[left]) i++; // 左から右へ走査し、ピボットより大きい最初の要素を探す
      _swap(nums, i, j); // この 2 要素を交換
    }
    _swap(nums, i, left); // ピボットを交換して左右の部分配列の境界に移す
    return i; // ピボットのインデックスを返す
  }

  /* クイックソート（再帰の深さを最適化） */
  static void quickSort(List<int> nums, int left, int right) {
    // 部分配列の長さが 1 になったら終了
    while (left < right) {
      // 左右から走査して分割
      int pivot = _partition(nums, left, right);
      // 短いほうの部分配列にクイックソートを適用
      if (pivot - left < right - pivot) {
        quickSort(nums, left, pivot - 1); // 左の部分配列を再帰的にソート
        left = pivot + 1; // 残りの未整列区間は [pivot + 1, right]
      } else {
        quickSort(nums, pivot + 1, right); // 右の部分配列を再帰的にソート
        right = pivot - 1; // 残りの未整列区間は [left, pivot - 1]
      }
    }
  }
}

/* 実行例 */
void main() {
  /* クイックソート */
  List<int> nums = [2, 4, 1, 0, 3, 5];
  QuickSort.quickSort(nums, 0, nums.length - 1);
  print("クイックソート後の nums = $nums");

  /* クイックソート（中央値をピボットに使用） */
  List<int> nums1 = [2, 4, 1, 0, 3, 5];
  QuickSortMedian.quickSort(nums1, 0, nums1.length - 1);
  print("クイックソート（中央値をピボットに使用）後の nums1 = $nums1");

  /* クイックソート（再帰の深さを最適化） */
  List<int> nums2 = [2, 4, 1, 0, 3, 5];
  QuickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
  print("クイックソート（再帰の深さを最適化）後の nums2 = $nums2");
}
