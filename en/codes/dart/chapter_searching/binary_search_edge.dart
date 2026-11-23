/**
 * File: binary_search_edge.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'binary_search_insertion.dart';

/* Find the leftmost occurrence of target using binary search */
int binarySearchLeftEdge(List<int> nums, int target) {
  // This is equivalent to finding the insertion point of target
  int i = binarySearchInsertion(nums, target);
  // If target was not found, return -1
  if (i == nums.length || nums[i] != target) {
    return -1;
  }
  // Target was found; return index i
  return i;
}

/* Find the rightmost occurrence of target using binary search */
int binarySearchRightEdge(List<int> nums, int target) {
  // Reduce the problem to finding the leftmost insertion point of target + 1
  int i = binarySearchInsertion(nums, target + 1);
  // i is the first index greater than target (or the array length); j is the candidate rightmost target index
  int j = i - 1;
  // If target was not found, return -1
  if (j == -1 || nums[j] != target) {
    return -1;
  }
  // Target was found; return index j
  return j;
}

/* Driver code */
void main() {
  // Array containing duplicate elements
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\nArray nums = $nums");

  // Find the left and right boundaries using binary search
  for (int target in [6, 7]) {
    int index = binarySearchLeftEdge(nums, target);
    print("Index of the leftmost occurrence of $target: $index");
    index = binarySearchRightEdge(nums, target);
    print("Index of the rightmost occurrence of $target: $index");
  }
}
