/**
 * File: binary_search_insertion.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Binary search for an insertion point (no duplicates) */
int binarySearchInsertionSimple(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // Initialize the closed interval [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // Compute the midpoint index m
    if (nums[m] < target) {
      i = m + 1; // Any match must lie in [m+1, j]
    } else if (nums[m] > target) {
      j = m - 1; // Any match must lie in [i, m-1]
    } else {
      return m; // Found target. Return insertion point m
    }
  }
  // Target not found. Return insertion point i
  return i;
}

/* Binary search for an insertion point (duplicates allowed) */
int binarySearchInsertion(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // Initialize the closed interval [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // Compute the midpoint index m
    if (nums[m] < target) {
      i = m + 1; // Any match must lie in [m+1, j]
    } else if (nums[m] > target) {
      j = m - 1; // Any match must lie in [i, m-1]
    } else {
      j = m - 1; // Look in [i, m-1] for the rightmost element less than target
    }
  }
  // Return insertion point i
  return i;
}

/* Driver code */
void main() {
  // Array without duplicates
  List<int> nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
  print("\nArray nums = $nums");
  // Find the insertion point using binary search
  for (int target in [6, 9]) {
    int index = binarySearchInsertionSimple(nums, target);
    print("Insertion index for $target = $index");
  }

  // Array with duplicates
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\nArray nums = $nums");
  // Find the insertion point using binary search
  for (int target in [2, 6, 20]) {
    int index = binarySearchInsertion(nums, target);
    print("Insertion index for $target = $index");
  }
}
