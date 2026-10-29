/**
 * File: quick_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* クイックソートクラス */
class QuickSort {
    /* 要素の交換 */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 番兵を用いた分割 */
    partition(nums, left, right) {
        // nums[left] をピボットとする
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // 右から左へ、ピボットより小さい最初の要素を探す
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // 左から右へ、ピボットより大きい最初の要素を探す
            }
            // 要素の交換
            this.swap(nums, i, j); // この 2 つの要素を交換する
        }
        this.swap(nums, i, left); // ピボットを 2 つの部分配列の境界に移す
        return i; // ピボットのインデックスを返す
    }

    /* クイックソート */
    quickSort(nums, left, right) {
        // 部分配列の長さが 1 になったら再帰を終了する
        if (left >= right) return;
        // 番兵を用いた分割
        const pivot = this.partition(nums, left, right);
        // 左部分配列と右部分配列を再帰的に処理する
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* クイックソートクラス（中央値ピボットによる最適化） */
class QuickSortMedian {
    /* 要素の交換 */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 候補となる 3 要素の中央値を選ぶ */
    medianThree(nums, left, mid, right) {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m が l と r の間にある
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l が m と r の間にある
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* 番兵を用いた分割（3 値の中央値を選択） */
    partition(nums, left, right) {
        // 候補となる 3 要素の中央値を選ぶ
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // 中央値を配列の左端に移す
        this.swap(nums, left, med);
        // nums[left] をピボットとする
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // 右から左へ、ピボットより小さい最初の要素を探す
            while (i < j && nums[i] <= nums[left]) i++; // 左から右へ、ピボットより大きい最初の要素を探す
            this.swap(nums, i, j); // この 2 つの要素を交換する
        }
        this.swap(nums, i, left); // ピボットを 2 つの部分配列の境界に移す
        return i; // ピボットのインデックスを返す
    }

    /* クイックソート */
    quickSort(nums, left, right) {
        // 部分配列の長さが 1 になったら再帰を終了する
        if (left >= right) return;
        // 番兵を用いた分割
        const pivot = this.partition(nums, left, right);
        // 左部分配列と右部分配列を再帰的に処理する
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* クイックソートクラス（再帰の深さの最適化） */
class QuickSortTailCall {
    /* 要素の交換 */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 番兵を用いた分割 */
    partition(nums, left, right) {
        // nums[left] をピボットとする
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // 右から左へ、ピボットより小さい最初の要素を探す
            while (i < j && nums[i] <= nums[left]) i++; // 左から右へ、ピボットより大きい最初の要素を探す
            this.swap(nums, i, j); // この 2 つの要素を交換する
        }
        this.swap(nums, i, left); // ピボットを 2 つの部分配列の境界に移す
        return i; // ピボットのインデックスを返す
    }

    /* クイックソート（再帰の深さの最適化） */
    quickSort(nums, left, right) {
        // 部分配列の長さが 1 になったら終了する
        while (left < right) {
            // 番兵を用いた分割操作
            let pivot = this.partition(nums, left, right);
            // 2 つの部分配列のうち短いほうにクイックソートを適用する
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // 左部分配列を再帰的にソートする
                left = pivot + 1; // 残りの未ソート区間は [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // 右部分配列を再帰的にソートする
                right = pivot - 1; // 残りの未ソート区間は [left, pivot - 1]
            }
        }
    }
}

/* 実行用コード */
/* クイックソート  */
const nums = [2, 4, 1, 0, 3, 5];
const quickSort = new QuickSort();
quickSort.quickSort(nums, 0, nums.length - 1);
console.log('クイックソート完了後 nums =', nums);

/* クイックソート（中央値ピボットによる最適化） */
const nums1 = [2, 4, 1, 0, 3, 5];
const quickSortMedian = new QuickSortMedian();
quickSortMedian.quickSort(nums1, 0, nums1.length - 1);
console.log('クイックソート（中央値ピボットによる最適化）の完了後 nums =', nums1);

/* クイックソート（再帰の深さの最適化） */
const nums2 = [2, 4, 1, 0, 3, 5];
const quickSortTailCall = new QuickSortTailCall();
quickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
console.log('クイックソート（再帰の深さの最適化）の完了後 nums =', nums2);
