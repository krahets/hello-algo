/**
 * File: bubble_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* Bubble sort */
void bubbleSort(List<int> nums) {
  // Outer loop: the unsorted range is [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
    for (int j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // Swap nums[j] and nums[j + 1]
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
      }
    }
  }
}

/* Bubble sort (flag optimization)*/
void bubbleSortWithFlag(List<int> nums) {
  // Outer loop: the unsorted range is [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    bool flag = false; // Initialize the flag
    // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
    for (int j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // Swap nums[j] and nums[j + 1]
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        flag = true; // Record that a swap occurred
      }
    }
    if (!flag) break; // Exit immediately if this pass made no swaps
  }
}

/* Driver code */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  bubbleSort(nums);
  print("After bubble sort, nums = $nums");

  List<int> nums1 = [4, 1, 3, 1, 5, 2];
  bubbleSortWithFlag(nums1);
  print("After bubble sort, nums1 = $nums1");
}
