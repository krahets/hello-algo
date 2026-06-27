/**
 * File: binary_search_edge.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'binary_search_insertion.dart';

/* Binary search for the leftmost target */
int binarySearchLeftEdge(List<int> nums, int target) {
  // Equivalent to finding the insertion point of target
  int i = binarySearchInsertion(nums, target);
  // Target not found, return -1
  if (i == nums.length || nums[i] != target) {
    return -1;
  }
  // Found target, return index i
  return i;
}

/* Binary search for the rightmost target */
int binarySearchRightEdge(List<int> nums, int target) {
  // Convert to finding the leftmost target + 1
  int i = binarySearchInsertion(nums, target + 1);
  // j points to the rightmost target, i points to the first element greater than target
  int j = i - 1;
  // Target not found, return -1
  if (j == -1 || nums[j] != target) {
    return -1;
  }
  // Found target, return index j
  return j;
}

/* Driver Code */
void main() {
  // Array with duplicate elements
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\nArray nums = $nums");

  // Binary search left and right boundaries
  for (int target in [6, 7]) {
    int index = binarySearchLeftEdge(nums, target);
    print("Leftmost element $target index is $index");
    index = binarySearchRightEdge(nums, target);
    print("Rightmost element $target index is $index");
  }
}
