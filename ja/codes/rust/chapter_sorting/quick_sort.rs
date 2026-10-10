/**
 * File: quick_sort.rs
 * Created Time: 2023-02-16
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

/* クイックソート */
struct QuickSort;

impl QuickSort {
    /* 番兵分割 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // nums[left] を基準値とする
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 右から左へ基準値未満の最初の要素を探す
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 左から右へ基準値より大きい最初の要素を探す
            }
            nums.swap(i, j); // この 2 つの要素を交換
        }
        nums.swap(i, left); // 基準値を 2 つの部分配列の境界へ交換する
        i // 基準値のインデックスを返す
    }

    /* クイックソート */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 部分配列の長さが 1 なら再帰を終了する
        if left >= right {
            return;
        }
        // 番兵分割
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 左右の部分配列を再帰処理
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* クイックソート（中央値の基準値で最適化） */
struct QuickSortMedian;

impl QuickSortMedian {
    /* 3つの候補要素の中央値を選ぶ */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m は l と r の間
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l は m と r の間
        }
        right
    }

    /* 番兵による分割処理（3 点中央値） */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 3つの候補要素の中央値を選ぶ
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // 中央値を配列の最左端に交換する
        nums.swap(left, med);
        // nums[left] を基準値とする
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 右から左へ基準値未満の最初の要素を探す
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 左から右へ基準値より大きい最初の要素を探す
            }
            nums.swap(i, j); // この 2 つの要素を交換
        }
        nums.swap(i, left); // 基準値を 2 つの部分配列の境界へ交換する
        i // 基準値のインデックスを返す
    }

    /* クイックソート */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 部分配列の長さが 1 なら再帰を終了する
        if left >= right {
            return;
        }
        // 番兵分割
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 左右の部分配列を再帰処理
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* クイックソート（再帰深度最適化） */
struct QuickSortTailCall;

impl QuickSortTailCall {
    /* 番兵分割 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // nums[left] を基準値とする
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 右から左へ基準値未満の最初の要素を探す
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 左から右へ基準値より大きい最初の要素を探す
            }
            nums.swap(i, j); // この 2 つの要素を交換
        }
        nums.swap(i, left); // 基準値を 2 つの部分配列の境界へ交換する
        i // 基準値のインデックスを返す
    }

    /* クイックソート（再帰深度最適化） */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // 部分配列の長さが 1 なら終了
        while left < right {
            // 番兵による分割処理
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // 2 つの部分配列のうち短いほうにクイックソートを適用する
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // 左部分配列を再帰的にソート
                left = pivot + 1; // 未ソート区間の残りは [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // 右部分配列を再帰的にソート
                right = pivot - 1; // 未ソート区間の残りは [left, pivot - 1]
            }
        }
    }
}

/* Driver Code */
fn main() {
    /* クイックソート */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSort::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("クイックソート完了後 nums = {:?}", nums);

    /* クイックソート（中央値の基準値で最適化） */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortMedian::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("クイックソート（中央値ピボット最適化）完了後 nums = {:?}", nums);

    /* クイックソート（再帰深度最適化） */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortTailCall::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("クイックソート（再帰深度最適化）完了後 nums = {:?}", nums);
}
