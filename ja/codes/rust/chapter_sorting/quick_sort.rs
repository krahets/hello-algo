/**
 * File: quick_sort.rs
 * Created Time: 2023-02-16
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

/* クイックソート */
struct QuickSort;

impl QuickSort {
    /* 左右から走査して分割 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // nums[left] をピボットとする
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 右から左へ走査し、ピボットより小さい最初の要素を探す
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 左から右へ走査し、ピボットより大きい最初の要素を探す
            }
            nums.swap(i, j); // この 2 要素を交換
        }
        nums.swap(i, left); // ピボットを交換して左右の部分配列の境界に移す
        i // ピボットのインデックスを返す
    }

    /* クイックソート */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 部分配列の長さが 1 になったら再帰を終了
        if left >= right {
            return;
        }
        // 左右から走査して分割
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 左右の部分配列を再帰的に処理
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* クイックソート（中央値をピボットに使用） */
struct QuickSortMedian;

impl QuickSortMedian {
    /* 3 つの候補の中央値を選ぶ */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m の値は l と r の値の間にある
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l の値は m と r の値の間にある
        }
        right
    }

    /* 左右から走査して分割（3 要素の中央値を使用） */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 3 つの候補の中央値を選ぶ
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // 中央値の要素を配列の左端に移す
        nums.swap(left, med);
        // nums[left] をピボットとする
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 右から左へ走査し、ピボットより小さい最初の要素を探す
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 左から右へ走査し、ピボットより大きい最初の要素を探す
            }
            nums.swap(i, j); // この 2 要素を交換
        }
        nums.swap(i, left); // ピボットを交換して左右の部分配列の境界に移す
        i // ピボットのインデックスを返す
    }

    /* クイックソート */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 部分配列の長さが 1 になったら再帰を終了
        if left >= right {
            return;
        }
        // 左右から走査して分割
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 左右の部分配列を再帰的に処理
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* クイックソート（再帰の深さを最適化） */
struct QuickSortTailCall;

impl QuickSortTailCall {
    /* 左右から走査して分割 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // nums[left] をピボットとする
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 右から左へ走査し、ピボットより小さい最初の要素を探す
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 左から右へ走査し、ピボットより大きい最初の要素を探す
            }
            nums.swap(i, j); // この 2 要素を交換
        }
        nums.swap(i, left); // ピボットを交換して左右の部分配列の境界に移す
        i // ピボットのインデックスを返す
    }

    /* クイックソート（再帰の深さを最適化） */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // 部分配列の長さが 1 になったら終了
        while left < right {
            // 左右から走査して分割
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // 短いほうの部分配列にクイックソートを適用
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // 左の部分配列を再帰的にソート
                left = pivot + 1; // 残りの未整列区間は [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // 右の部分配列を再帰的にソート
                right = pivot - 1; // 残りの未整列区間は [left, pivot - 1]
            }
        }
    }
}

/* 実行例 */
fn main() {
    /* クイックソート */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSort::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("クイックソート後の nums = {:?}", nums);

    /* クイックソート（中央値をピボットに使用） */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortMedian::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("クイックソート（中央値をピボットに使用）後の nums = {:?}", nums);

    /* クイックソート（再帰の深さを最適化） */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortTailCall::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("クイックソート（再帰の深さを最適化）後の nums = {:?}", nums);
}
