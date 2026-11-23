/**
 * File: binary_search_insertion.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Find an insertion point using binary search (no duplicates) */
int binarySearchInsertionSimple(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // Initialize the closed interval [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // Calculate the midpoint index m
    if (nums[m] < target) {
      i = m + 1; // Target must be in [m+1, j] if it exists
    } else if (nums[m] > target) {
      j = m - 1; // Target must be in [i, m-1] if it exists
    } else {
      return m; // Target was found; return insertion point m
    }
  }
  // Target was not found; return insertion point i
  return i;
}

/* Find an insertion point using binary search (with duplicates) */
int binarySearchInsertion(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // Initialize the closed interval [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // Calculate the midpoint index m
    if (nums[m] < target) {
      i = m + 1; // Target must be in [m+1, j] if it exists
    } else if (nums[m] > target) {
      j = m - 1; // Target must be in [i, m-1] if it exists
    } else {
      j = m - 1; // Continue in [i, m-1] to find the rightmost element smaller than target
    }
  }
  // Return insertion point i
  return i;
}

/* Driver code */
void main() {
  // Array with no duplicate elements
  List<int> nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
  print("\nArray nums = $nums");
  // Find an insertion point using binary search
  for (int target in [6, 9]) {
    int index = binarySearchInsertionSimple(nums, target);
    print("Insertion index for $target: $index");
  }

  // Array containing duplicate elements
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\nArray nums = $nums");
  // Find an insertion point using binary search
  for (int target in [2, 6, 20]) {
    int index = binarySearchInsertion(nums, target);
    print("Insertion index for $target: $index");
  }
}
