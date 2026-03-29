/**
 * File: quick_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* クイックソートクラス */
class QuickSort {
    /* 要素の交換 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 番兵分割 */
    partition(nums: number[], left: number, right: number): number {
        // nums[left] を基準値とする
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // 右から左へ基準値未満の最初の要素を探す
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // 左から右へ基準値より大きい最初の要素を探す
            }
            // 要素の交換
            this.swap(nums, i, j); // この 2 つの要素を交換
        }
        this.swap(nums, i, left); // 基準値を 2 つの部分配列の境界へ交換する
        return i; // 基準値のインデックスを返す
    }

    /* クイックソート */
    quickSort(nums: number[], left: number, right: number): void {
        // 部分配列の長さが 1 なら再帰を終了する
        if (left >= right) {
            return;
        }
        // 番兵分割
        const pivot = this.partition(nums, left, right);
        // 左右の部分配列を再帰処理
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* クイックソートクラス（中央値ピボット最適化） */
class QuickSortMedian {
    /* 要素の交換 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 3つの候補要素の中央値を選ぶ */
    medianThree(
        nums: number[],
        left: number,
        mid: number,
        right: number
    ): number {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m は l と r の間
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l は m と r の間
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* 番兵による分割処理（3 点中央値） */
    partition(nums: number[], left: number, right: number): number {
        // 3つの候補要素の中央値を選ぶ
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // 中央値を配列の最左端に交換する
        this.swap(nums, left, med);
        // nums[left] を基準値とする
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // 右から左へ基準値未満の最初の要素を探す
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // 左から右へ基準値より大きい最初の要素を探す
            }
            this.swap(nums, i, j); // この 2 つの要素を交換
        }
        this.swap(nums, i, left); // 基準値を 2 つの部分配列の境界へ交換する
        return i; // 基準値のインデックスを返す
    }

    /* クイックソート */
    quickSort(nums: number[], left: number, right: number): void {
        // 部分配列の長さが 1 なら再帰を終了する
        if (left >= right) {
            return;
        }
        // 番兵分割
        const pivot = this.partition(nums, left, right);
        // 左右の部分配列を再帰処理
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* クイックソートクラス（再帰深度最適化） */
class QuickSortTailCall {
    /* 要素の交換 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 番兵分割 */
    partition(nums: number[], left: number, right: number): number {
        // nums[left] を基準値とする
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // 右から左へ基準値未満の最初の要素を探す
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // 左から右へ基準値より大きい最初の要素を探す
            }
            this.swap(nums, i, j); // この 2 つの要素を交換
        }
        this.swap(nums, i, left); // 基準値を 2 つの部分配列の境界へ交換する
        return i; // 基準値のインデックスを返す
    }

    /* クイックソート（再帰深度最適化） */
    quickSort(nums: number[], left: number, right: number): void {
        // 部分配列の長さが 1 なら終了
        while (left < right) {
            // 番兵による分割処理
            let pivot = this.partition(nums, left, right);
            // 2 つの部分配列のうち短いほうにクイックソートを適用する
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // 左部分配列を再帰的にソート
                left = pivot + 1; // 未ソート区間の残りは [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // 右部分配列を再帰的にソート
                right = pivot - 1; // 未ソート区間の残りは [left, pivot - 1]
            }
        }
    }
}

/* Driver Code */
/* クイックソート */
const nums = [2, 4, 1, 0, 3, 5];
const quickSort = new QuickSort();
quickSort.quickSort(nums, 0, nums.length - 1);
console.log('クイックソート完了後 nums =', nums);

/* クイックソート（中央値の基準値で最適化） */
const nums1 = [2, 4, 1, 0, 3, 5];
const quickSortMedian = new QuickSortMedian();
quickSortMedian.quickSort(nums1, 0, nums1.length - 1);
console.log('クイックソート（中央値ピボット最適化）完了後 nums =', nums1);

/* クイックソート（再帰深度最適化） */
const nums2 = [2, 4, 1, 0, 3, 5];
const quickSortTailCall = new QuickSortTailCall();
quickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
console.log('クイックソート（再帰深度最適化）完了後 nums =', nums2);

export {};
