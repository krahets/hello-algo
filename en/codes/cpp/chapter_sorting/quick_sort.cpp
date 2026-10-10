/**
 * File: quick_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Quick sort class */
class QuickSort {
  private:
    /* Sentinel partition */
    static int partition(vector<int> &nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;                // Search from left to right for the first element greater than the pivot
            swap(nums[i], nums[j]); // Swap these two elements
        }
        swap(nums[i], nums[left]);  // Swap the pivot to the boundary between the two subarrays
        return i;                   // Return the index of the pivot
    }

  public:
    /* Quick sort */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Terminate recursion when subarray length is 1
        if (left >= right)
            return;
        // Sentinel partition
        int pivot = partition(nums, left, right);
        // Recursively process the left subarray and right subarray
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
            return mid; // m is between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l is between m and r
        return right;
    }

    /* Sentinel partition (median of three) */
    static int partition(vector<int> &nums, int left, int right) {
        // Select the median of three candidate elements
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Swap the median to the array's leftmost position
        swap(nums[left], nums[med]);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;                // Search from left to right for the first element greater than the pivot
            swap(nums[i], nums[j]); // Swap these two elements
        }
        swap(nums[i], nums[left]);  // Swap the pivot to the boundary between the two subarrays
        return i;                   // Return the index of the pivot
    }

  public:
    /* Quick sort */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Terminate recursion when subarray length is 1
        if (left >= right)
            return;
        // Sentinel partition
        int pivot = partition(nums, left, right);
        // Recursively process the left subarray and right subarray
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* Quick sort class (recursion depth optimization) */
class QuickSortTailCall {
  private:
    /* Sentinel partition */
    static int partition(vector<int> &nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;                // Search from left to right for the first element greater than the pivot
            swap(nums[i], nums[j]); // Swap these two elements
        }
        swap(nums[i], nums[left]);  // Swap the pivot to the boundary between the two subarrays
        return i;                   // Return the index of the pivot
    }

  public:
    /* Quick sort (recursion depth optimization) */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Terminate when subarray length is 1
        while (left < right) {
            // Sentinel partition operation
            int pivot = partition(nums, left, right);
            // Perform quick sort on the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1;                 // Remaining unsorted interval is [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1;                 // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
};

/* Driver Code */
int main() {
    /* Quick sort */
    vector<int> nums{2, 4, 1, 0, 3, 5};
    QuickSort::quickSort(nums, 0, nums.size() - 1);
    cout << "After quick sort completes, nums = ";
    printVector(nums);

    /* Quick sort (recursion depth optimization) */
    vector<int> nums1 = {2, 4, 1, 0, 3, 5};
    QuickSortMedian::quickSort(nums1, 0, nums1.size() - 1);
    cout << "After quick sort (median pivot optimization), nums = ";
    printVector(nums1);

    /* Quick sort (recursion depth optimization) */
    vector<int> nums2 = {2, 4, 1, 0, 3, 5};
    QuickSortTailCall::quickSort(nums2, 0, nums2.size() - 1);
    cout << "After quick sort (recursion depth optimization), nums = ";
    printVector(nums2);

    return 0;
}
