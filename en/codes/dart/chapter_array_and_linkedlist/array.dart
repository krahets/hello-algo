/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* Access an element at a random index */
int randomAccess(List<int> nums) {
  // Choose a random index in the interval [0, nums.length)
  int randomIndex = Random().nextInt(nums.length);
  // Get and return the randomly selected element
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* Extend the array length */
List<int> extend(List<int> nums, int enlarge) {
  // Initialize an array with the extended length
  List<int> res = List.filled(nums.length + enlarge, 0);
  // Copy all elements from the original array to the new array
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // Return the new, extended array
  return res;
}

/* Insert element _num at index in the array */
void insert(List<int> nums, int _num, int index) {
  // Shift all elements at and after index `index` one position to the right
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // Assign _num to the element at index
  nums[index] = _num;
}

/* Remove the element at index `index` */
void remove(List<int> nums, int index) {
  // Shift all elements after index `index` one position to the left
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
  // Traverse the array using forEach
  nums.forEach((_num) {
    count += _num;
  });
}

/* Find a specified element in the array */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* Driver code */
void main() {
  /* Initialize the array */
  var arr = List.filled(5, 0);
  print('Array arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('Array nums = $nums');

  /* Random access */
  int randomNum = randomAccess(nums);
  print('Random element from nums: $randomNum');

  /* Extend the length */
  nums = extend(nums, 3);
  print('After extending the array length to 8, nums = $nums');

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
  print("Search for 3 in nums: index = $index");
}
