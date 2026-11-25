/**
 * File: quick_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 快速排序類別 */
class QuickSort {
    /* 交換元素 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 哨兵分割 */
    partition(nums: number[], left: number, right: number): number {
        // 以 nums[left] 為基準值
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // 從右向左尋找第一個小於基準值的元素
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // 從左向右尋找第一個大於基準值的元素
            }
            // 交換元素
            this.swap(nums, i, j); // 交換這兩個元素
        }
        this.swap(nums, i, left); // 交換元素，將基準值移到兩個子陣列的交界處
        return i; // 回傳基準值的索引
    }

    /* 快速排序 */
    quickSort(nums: number[], left: number, right: number): void {
        // 子陣列長度為 1 時終止遞迴
        if (left >= right) {
            return;
        }
        // 哨兵分割
        const pivot = this.partition(nums, left, right);
        // 遞迴處理左、右子陣列
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* 快速排序類別（以中位數作為基準值的最佳化） */
class QuickSortMedian {
    /* 交換元素 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 取三個候選元素的中位數 */
    medianThree(
        nums: number[],
        left: number,
        mid: number,
        right: number
    ): number {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m 介於 l 和 r 之間
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l 介於 m 和 r 之間
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* 哨兵分割（三數取中） */
    partition(nums: number[], left: number, right: number): number {
        // 取三個候選元素的中位數
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // 將中位數與陣列最左端的元素交換
        this.swap(nums, left, med);
        // 以 nums[left] 為基準值
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // 從右向左尋找第一個小於基準值的元素
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // 從左向右尋找第一個大於基準值的元素
            }
            this.swap(nums, i, j); // 交換這兩個元素
        }
        this.swap(nums, i, left); // 交換元素，將基準值移到兩個子陣列的交界處
        return i; // 回傳基準值的索引
    }

    /* 快速排序 */
    quickSort(nums: number[], left: number, right: number): void {
        // 子陣列長度為 1 時終止遞迴
        if (left >= right) {
            return;
        }
        // 哨兵分割
        const pivot = this.partition(nums, left, right);
        // 遞迴處理左、右子陣列
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* 快速排序類別（遞迴深度最佳化） */
class QuickSortTailCall {
    /* 交換元素 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 哨兵分割 */
    partition(nums: number[], left: number, right: number): number {
        // 以 nums[left] 為基準值
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // 從右向左尋找第一個小於基準值的元素
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // 從左向右尋找第一個大於基準值的元素
            }
            this.swap(nums, i, j); // 交換這兩個元素
        }
        this.swap(nums, i, left); // 交換元素，將基準值移到兩個子陣列的交界處
        return i; // 回傳基準值的索引
    }

    /* 快速排序（遞迴深度最佳化） */
    quickSort(nums: number[], left: number, right: number): void {
        // 子陣列長度為 1 時終止
        while (left < right) {
            // 執行哨兵分割
            let pivot = this.partition(nums, left, right);
            // 對兩個子陣列中較短的一個執行快速排序
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // 遞迴排序左子陣列
                left = pivot + 1; // 剩餘的未排序區間為 [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // 遞迴排序右子陣列
                right = pivot - 1; // 剩餘的未排序區間為 [left, pivot - 1]
            }
        }
    }
}

/* 主程式 */
/* 快速排序  */
const nums = [2, 4, 1, 0, 3, 5];
const quickSort = new QuickSort();
quickSort.quickSort(nums, 0, nums.length - 1);
console.log('快速排序完成後 nums =', nums);

/* 快速排序（以中位數作為基準值的最佳化） */
const nums1 = [2, 4, 1, 0, 3, 5];
const quickSortMedian = new QuickSortMedian();
quickSortMedian.quickSort(nums1, 0, nums1.length - 1);
console.log('快速排序（以中位數作為基準值的最佳化）完成後 nums =', nums1);

/* 快速排序（遞迴深度最佳化） */
const nums2 = [2, 4, 1, 0, 3, 5];
const quickSortTailCall = new QuickSortTailCall();
quickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
console.log('快速排序（遞迴深度最佳化）完成後 nums =', nums2);

export {};
