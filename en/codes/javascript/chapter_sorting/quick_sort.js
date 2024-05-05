/**
 * File: quick_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Quick sort class */
class QuickSort {
    /* Swap elements */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Partition */
    partition(nums, left, right) {
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // Search from right to left for the first element smaller than the pivot
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // Search from left to right for the first element greater than the pivot
            }
            // Swap elements
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
        return i; // Return the index of the pivot
    }

    /* Quick sort */
    quickSort(nums, left, right) {
        // Terminate recursion when subarray length is 1
        if (left >= right) return;
        // Partition
        const pivot = this.partition(nums, left, right);
        // Recursively process the left subarray and right subarray
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* Quick sort class (median pivot optimization) */
class QuickSortMedian {
    /* Swap elements */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Select the median of three candidate elements */
    medianThree(nums, left, mid, right) {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m is between l and r
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l is between m and r
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* Partition (median of three) */
    partition(nums, left, right) {
        // Select the median of three candidate elements
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // Swap the median to the array's leftmost position
        this.swap(nums, left, med);
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left]) i++; // Search from left to right for the first element greater than the pivot
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
        return i; // Return the index of the pivot
    }

    /* Quick sort */
    quickSort(nums, left, right) {
        // Terminate recursion when subarray length is 1
        if (left >= right) return;
        // Partition
        const pivot = this.partition(nums, left, right);
        // Recursively process the left subarray and right subarray
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* Quick sort class (tail recursion optimization) */
class QuickSortTailCall {
    /* Swap elements */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Partition */
    partition(nums, left, right) {
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left]) i++; // Search from left to right for the first element greater than the pivot
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
        return i; // Return the index of the pivot
    }

    /* Quick sort (tail recursion optimization) */
    quickSort(nums, left, right) {
        // Terminate when subarray length is 1
        while (left < right) {
            // Partition operation
            let pivot = this.partition(nums, left, right);
            // Perform quick sort on the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1; // Remaining unsorted interval is [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
}

/* Driver Code */
/* Quick sort  */
const nums = [2, 4, 1, 0, 3, 5];
const quickSort = new QuickSort();
quickSort.quickSort(nums, 0, nums.length - 1);
console.log('Quick sort completed nums =', nums);

/* Quick sort (median pivot optimization) */
const nums1 = [2, 4, 1, 0, 3, 5];
const quickSortMedian = new QuickSortMedian();
quickSortMedian.quickSort(nums1, 0, nums1.length - 1);
console.log('Quick sort (median pivot optimization) completed nums =', nums1);

/* Quick sort (tail recursion optimization) */
const nums2 = [2, 4, 1, 0, 3, 5];
const quickSortTailCall = new QuickSortTailCall();
quickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
console.log('Quick sort (tail recursion optimization) completed nums =', nums2);
