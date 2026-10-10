/**
 * File: insertion_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* Insertion sort */
void insertionSort(List<int> nums) {
  // Outer loop: sorted interval is [0, i-1]
  for (int i = 1; i < nums.length; i++) {
    int base = nums[i], j = i - 1;
    // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
    while (j >= 0 && nums[j] > base) {
      nums[j + 1] = nums[j]; // Move nums[j] to the right by one position
      j--;
    }
    nums[j + 1] = base; // Assign base to the correct position
  }
}

/* Driver Code */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  insertionSort(nums);
  print("After insertion sort, nums = $nums");
}
