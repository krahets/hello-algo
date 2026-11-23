/**
 * File: quick_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Quick sort class */
class QuickSort {
  private:
    /* Two-pointer partitioning */
    static int partition(vector<int> &nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;                // Scan from left to right for the first element larger than the pivot
            swap(nums[i], nums[j]); // Swap these two elements
        }
        swap(nums[i], nums[left]);  // Swap the pivot into the boundary position between the two subarrays
        return i;                   // Return the pivot index
    }

  public:
    /* Quick sort */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Stop recursing when the subarray has at most one element
        if (left >= right)
            return;
        // Two-pointer partitioning
        int pivot = partition(nums, left, right);
        // Recurse on the left and right subarrays
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* Quick sort class (median pivot optimization) */
class QuickSortMedian {
  private:
    /* Select the median of three candidate elements */
    static int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m lies between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l lies between m and r
        return right;
    }

    /* Two-pointer partitioning (median of three) */
    static int partition(vector<int> &nums, int left, int right) {
        // Select the median of three candidate elements
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Swap the median into the leftmost position of the current subarray
        swap(nums[left], nums[med]);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;                // Scan from left to right for the first element larger than the pivot
            swap(nums[i], nums[j]); // Swap these two elements
        }
        swap(nums[i], nums[left]);  // Swap the pivot into the boundary position between the two subarrays
        return i;                   // Return the pivot index
    }

  public:
    /* Quick sort */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Stop recursing when the subarray has at most one element
        if (left >= right)
            return;
        // Two-pointer partitioning
        int pivot = partition(nums, left, right);
        // Recurse on the left and right subarrays
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* Quick sort class (recursion depth optimization) */
class QuickSortTailCall {
  private:
    /* Two-pointer partitioning */
    static int partition(vector<int> &nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;                // Scan from left to right for the first element larger than the pivot
            swap(nums[i], nums[j]); // Swap these two elements
        }
        swap(nums[i], nums[left]);  // Swap the pivot into the boundary position between the two subarrays
        return i;                   // Return the pivot index
    }

  public:
    /* Quick sort (recursion depth optimization) */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Stop when the subarray has at most one element
        while (left < right) {
            // Perform two-pointer partitioning
            int pivot = partition(nums, left, right);
            // Apply quick sort to the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1;                 // The remaining unsorted range is [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1;                 // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
};

/* Driver code */
int main() {
    /* Quick sort */
    vector<int> nums{2, 4, 1, 0, 3, 5};
    QuickSort::quickSort(nums, 0, nums.size() - 1);
    cout << "After quick sort, nums = ";
    printVector(nums);

    /* Quick sort (median pivot optimization) */
    vector<int> nums1 = {2, 4, 1, 0, 3, 5};
    QuickSortMedian::quickSort(nums1, 0, nums1.size() - 1);
    cout << "After quick sort with median-of-three pivot selection, nums1 = ";
    printVector(nums1);

    /* Quick sort (recursion depth optimization) */
    vector<int> nums2 = {2, 4, 1, 0, 3, 5};
    QuickSortTailCall::quickSort(nums2, 0, nums2.size() - 1);
    cout << "After quick sort with recursion-depth optimization, nums2 = ";
    printVector(nums2);

    return 0;
}
