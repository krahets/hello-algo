/**
 * File: quick_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 快速排序类 */
class QuickSort {
    /* 元素交换 */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 哨兵划分 */
    partition(nums, left, right) {
        // 以 nums[left] 为基准数
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // 从右向左找首个小于基准数的元素
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // 从左向右找首个大于基准数的元素
            }
            // 元素交换
            this.swap(nums, i, j); // 交换这两个元素
        }
        this.swap(nums, i, left); // 将基准数交换至两子数组的分界线
        return i; // 返回基准数的索引
    }

    /* 快速排序 */
    quickSort(nums, left, right) {
        // 子数组长度为 1 时终止递归
        if (left >= right) return;
        // 哨兵划分
        const pivot = this.partition(nums, left, right);
        // 递归左子数组、右子数组
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* 快速排序类（中位基准数优化） */
class QuickSortMedian {
    /* 元素交换 */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 选取三个候选元素的中位数 */
    medianThree(nums, left, mid, right) {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m 在 l 和 r 之间
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l 在 m 和 r 之间
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* 哨兵划分（三数取中值） */
    partition(nums, left, right) {
        // 选取三个候选元素的中位数
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // 将中位数交换至数组最左端
        this.swap(nums, left, med);
        // 以 nums[left] 为基准数
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left]) i++; // 从左向右找首个大于基准数的元素
            this.swap(nums, i, j); // 交换这两个元素
        }
        this.swap(nums, i, left); // 将基准数交换至两子数组的分界线
        return i; // 返回基准数的索引
    }

    /* 快速排序 */
    quickSort(nums, left, right) {
        // 子数组长度为 1 时终止递归
        if (left >= right) return;
        // 哨兵划分
        const pivot = this.partition(nums, left, right);
        // 递归左子数组、右子数组
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* 快速排序类（尾递归优化） */
class QuickSortTailCall {
    /* 元素交换 */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 哨兵划分 */
    partition(nums, left, right) {
        // 以 nums[left] 为基准数
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left]) i++; // 从左向右找首个大于基准数的元素
            this.swap(nums, i, j); // 交换这两个元素
        }
        this.swap(nums, i, left); // 将基准数交换至两子数组的分界线
        return i; // 返回基准数的索引
    }

    /* 快速排序（尾递归优化） */
    quickSort(nums, left, right) {
        // 子数组长度为 1 时终止
        while (left < right) {
            // 哨兵划分操作
            let pivot = this.partition(nums, left, right);
            // 对两个子数组中较短的那个执行快速排序
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // 递归排序左子数组
                left = pivot + 1; // 剩余未排序区间为 [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // 递归排序右子数组
                right = pivot - 1; // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
}

/* Driver Code */
/* 快速排序  */
const nums = [2, 4, 1, 0, 3, 5];
const quickSort = new QuickSort();
quickSort.quickSort(nums, 0, nums.length - 1);
console.log('快速排序完成后 nums =', nums);

/* 快速排序（中位基准数优化） */
const nums1 = [2, 4, 1, 0, 3, 5];
const quickSortMedian = new QuickSortMedian();
quickSortMedian.quickSort(nums1, 0, nums1.length - 1);
console.log('快速排序（中位基准数优化）完成后 nums =', nums1);

/* 快速排序（尾递归优化） */
const nums2 = [2, 4, 1, 0, 3, 5];
const quickSortTailCall = new QuickSortTailCall();
quickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
console.log('快速排序（尾递归优化）完成后 nums =', nums2);
