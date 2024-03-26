/**
 * File: quick_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 快速排序類別 */
class QuickSort {
    /* 元素交換 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 哨兵劃分 */
    partition(nums: number[], left: number, right: number): number {
        // 以 nums[left] 為基準數
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // 從右向左找首個小於基準數的元素
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // 從左向右找首個大於基準數的元素
            }
            // 元素交換
            this.swap(nums, i, j); // 交換這兩個元素
        }
        this.swap(nums, i, left); // 將基準數交換至兩子陣列的分界線
        return i; // 返回基準數的索引
    }

    /* 快速排序 */
    quickSort(nums: number[], left: number, right: number): void {
        // 子陣列長度為 1 時終止遞迴
        if (left >= right) {
            return;
        }
        // 哨兵劃分
        const pivot = this.partition(nums, left, right);
        // 遞迴左子陣列、右子陣列
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* 快速排序類別（中位基準數最佳化） */
class QuickSortMedian {
    /* 元素交換 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 選取三個候選元素的中位數 */
    medianThree(
        nums: number[],
        left: number,
        mid: number,
        right: number
    ): number {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m 在 l 和 r 之間
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l 在 m 和 r 之間
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* 哨兵劃分（三數取中值） */
    partition(nums: number[], left: number, right: number): number {
        // 選取三個候選元素的中位數
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // 將中位數交換至陣列最左端
        this.swap(nums, left, med);
        // 以 nums[left] 為基準數
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // 從右向左找首個小於基準數的元素
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // 從左向右找首個大於基準數的元素
            }
            this.swap(nums, i, j); // 交換這兩個元素
        }
        this.swap(nums, i, left); // 將基準數交換至兩子陣列的分界線
        return i; // 返回基準數的索引
    }

    /* 快速排序 */
    quickSort(nums: number[], left: number, right: number): void {
        // 子陣列長度為 1 時終止遞迴
        if (left >= right) {
            return;
        }
        // 哨兵劃分
        const pivot = this.partition(nums, left, right);
        // 遞迴左子陣列、右子陣列
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* 快速排序類別（尾遞迴最佳化） */
class QuickSortTailCall {
    /* 元素交換 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 哨兵劃分 */
    partition(nums: number[], left: number, right: number): number {
        // 以 nums[left] 為基準數
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // 從右向左找首個小於基準數的元素
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // 從左向右找首個大於基準數的元素
            }
            this.swap(nums, i, j); // 交換這兩個元素
        }
        this.swap(nums, i, left); // 將基準數交換至兩子陣列的分界線
        return i; // 返回基準數的索引
    }

    /* 快速排序（尾遞迴最佳化） */
    quickSort(nums: number[], left: number, right: number): void {
        // 子陣列長度為 1 時終止
        while (left < right) {
            // 哨兵劃分操作
            let pivot = this.partition(nums, left, right);
            // 對兩個子陣列中較短的那個執行快速排序
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // 遞迴排序左子陣列
                left = pivot + 1; // 剩餘未排序區間為 [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // 遞迴排序右子陣列
                right = pivot - 1; // 剩餘未排序區間為 [left, pivot - 1]
            }
        }
    }
}

/* Driver Code */
/* 快速排序  */
const nums = [2, 4, 1, 0, 3, 5];
const quickSort = new QuickSort();
quickSort.quickSort(nums, 0, nums.length - 1);
console.log('快速排序完成後 nums =', nums);

/* 快速排序（中位基準數最佳化） */
const nums1 = [2, 4, 1, 0, 3, 5];
const quickSortMedian = new QuickSortMedian();
quickSortMedian.quickSort(nums1, 0, nums1.length - 1);
console.log('快速排序（中位基準數最佳化）完成後 nums =', nums1);

/* 快速排序（尾遞迴最佳化） */
const nums2 = [2, 4, 1, 0, 3, 5];
const quickSortTailCall = new QuickSortTailCall();
quickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
console.log('快速排序（尾遞迴最佳化）完成後 nums =', nums2);

export {};
