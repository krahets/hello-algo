/**
 * File: binary_search_edge.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'binary_search_insertion.dart';

/* Use binary search to find the leftmost occurrence of target */
int binarySearchLeftEdge(List<int> nums, int target) {
  // Equivalent to finding the insertion point for target
  int i = binarySearchInsertion(nums, target);
  // Target not found. Return -1
  if (i == nums.length || nums[i] != target) {
    return -1;
  }
  // Found target. Return index i
  return i;
}

/* Use binary search to find the rightmost occurrence of target */
int binarySearchRightEdge(List<int> nums, int target) {
  // Search for the leftmost occurrence of target + 1
  int i = binarySearchInsertion(nums, target + 1);
  // j points to the rightmost occurrence of target, and i to the first larger element
  int j = i - 1;
  // Target not found. Return -1
  if (j == -1 || nums[j] != target) {
    return -1;
  }
  // Found target. Return index j
  return j;
}

/* Driver code */
void main() {
  // Array with duplicates
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\nArray nums = $nums");

  // Find the left and right boundaries using binary search
  for (int target in [6, 7]) {
    int index = binarySearchLeftEdge(nums, target);
    print("Index of the leftmost occurrence of $target = $index");
    index = binarySearchRightEdge(nums, target);
    print("Index of the rightmost occurrence of $target = $index");
  }
}
