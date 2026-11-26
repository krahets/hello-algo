/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* Access a random element */
int randomAccess(List<int> nums) {
  // Pick a random index in [0, nums.length)
  int randomIndex = Random().nextInt(nums.length);
  // Get and return the element at that index
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* Extend the array */
List<int> extend(List<int> nums, int enlarge) {
  // Initialize an array with the new length
  List<int> res = List.filled(nums.length + enlarge, 0);
  // Copy all elements from the original array into the new array
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // Return the new, longer array
  return res;
}

/* Insert _num at the specified array index */
void insert(List<int> nums, int _num, int index) {
  // Shift the elements from index onward one position to the right
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // Store _num at the specified index
  nums[index] = _num;
}

/* Remove the element at the specified index */
void remove(List<int> nums, int index) {
  // Shift all elements after index one position to the left
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* Traverse the array elements */
void traverse(List<int> nums) {
  int count = 0;
  // Traverse the array by index
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // Iterate directly over the array elements
  for (int _num in nums) {
    count += _num;
  }
  // Use forEach to traverse the array
  nums.forEach((_num) {
    count += _num;
  });
}

/* Find a given element in the array */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* Driver Code */
void main() {
  /* Initialize the array */
  var arr = List.filled(5, 0);
  print('Array arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('Array nums = $nums');

  /* Random access */
  int randomNum = randomAccess(nums);
  print('Random element from nums: $randomNum');

  /* Extend the array */
  nums = extend(nums, 3);
  print('After extending the array to length 8, nums = $nums');

  /* Insert an element */
  insert(nums, 6, 3);
  print("After inserting 6 at index 3, nums = $nums");

  /* Remove an element */
  remove(nums, 2);
  print("After removing the element at index 2, nums = $nums");

  /* Traverse the array */
  traverse(nums);

  /* Find an element */
  int index = find(nums, 3);
  print("Index of 3 in nums = $index");
}
