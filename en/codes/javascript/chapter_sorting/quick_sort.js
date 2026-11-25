/**
 * File: quick_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Quicksort class */
class QuickSort {
    /* Swap elements */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Partition with two pointers */
    partition(nums, left, right) {
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // Scan from right to left for the first element smaller than the pivot
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // Scan from left to right for the first element larger than the pivot
            }
            // Swap elements
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot into place between the two subarrays
        return i; // Return the pivot index
    }

    /* Quicksort */
    quickSort(nums, left, right) {
        // Stop recursing when the subarray has length 1
        if (left >= right) return;
        // Partition with two pointers
        const pivot = this.partition(nums, left, right);
        // Recurse on the left and right subarrays
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* Quicksort class with median-of-three pivot selection */
class QuickSortMedian {
    /* Swap elements */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Select the median of three candidates */
    medianThree(nums, left, mid, right) {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m lies between l and r
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l lies between m and r
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* Partition with two pointers (median of three) */
    partition(nums, left, right) {
        // Select the median of three candidates
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // Swap the median into the leftmost position
        this.swap(nums, left, med);
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left]) i++; // Scan from left to right for the first element larger than the pivot
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot into place between the two subarrays
        return i; // Return the pivot index
    }

    /* Quicksort */
    quickSort(nums, left, right) {
        // Stop recursing when the subarray has length 1
        if (left >= right) return;
        // Partition with two pointers
        const pivot = this.partition(nums, left, right);
        // Recurse on the left and right subarrays
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* Quicksort class with reduced recursion depth */
class QuickSortTailCall {
    /* Swap elements */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Partition with two pointers */
    partition(nums, left, right) {
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left]) i++; // Scan from left to right for the first element larger than the pivot
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot into place between the two subarrays
        return i; // Return the pivot index
    }

    /* Quicksort with reduced recursion depth */
    quickSort(nums, left, right) {
        // Stop when the subarray has length 1
        while (left < right) {
            // Partition with two pointers
            let pivot = this.partition(nums, left, right);
            // Apply quicksort to the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1; // The remaining unsorted range is [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
}

/* Driver Code */
/* Quicksort  */
const nums = [2, 4, 1, 0, 3, 5];
const quickSort = new QuickSort();
quickSort.quickSort(nums, 0, nums.length - 1);
console.log('After quicksort, nums =', nums);

/* Quicksort with median-of-three pivot selection */
const nums1 = [2, 4, 1, 0, 3, 5];
const quickSortMedian = new QuickSortMedian();
quickSortMedian.quickSort(nums1, 0, nums1.length - 1);
console.log('After median-of-three quicksort, nums =', nums1);

/* Quicksort with reduced recursion depth */
const nums2 = [2, 4, 1, 0, 3, 5];
const quickSortTailCall = new QuickSortTailCall();
quickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
console.log('After quicksort with reduced recursion depth, nums =', nums2);
