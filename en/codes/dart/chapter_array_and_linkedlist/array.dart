/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* Random access to element */
int randomAccess(List<int> nums) {
  // Randomly select a number in the interval [0, nums.length)
  int randomIndex = Random().nextInt(nums.length);
  // Retrieve and return the random element
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* Extend array length */
List<int> extend(List<int> nums, int enlarge) {
  // Initialize an array with extended length
  List<int> res = List.filled(nums.length + enlarge, 0);
  // Copy all elements from the original array to the new array
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // Return the extended new array
  return res;
}

/* Insert element _num at array index index */
void insert(List<int> nums, int _num, int index) {
  // Move all elements at and after index index backward by one position
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // Assign _num to element at index
  nums[index] = _num;
}

/* Remove the element at index index */
void remove(List<int> nums, int index) {
  // Move all elements after index index forward by one position
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* Traverse array elements */
void traverse(List<int> nums) {
  int count = 0;
  // Traverse array by index
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // Direct traversal of array elements
  for (int _num in nums) {
    count += _num;
  }
  // Traverse array using forEach method
  nums.forEach((_num) {
    count += _num;
  });
}

/* Find the specified element in the array */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* Driver Code */
void main() {
  /* Initialize array */
  var arr = List.filled(5, 0);
  print('Array arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('Array nums = $nums');

  /* Insert element */
  int randomNum = randomAccess(nums);
  print('Get random element $randomNum from nums');

  /* Traverse array */
  nums = extend(nums, 3);
  print('Extend array length to 8, get nums = $nums');

  /* Insert element */
  insert(nums, 6, 3);
  print("Insert number 6 at index 3, get nums = $nums");

  /* Remove element */
  remove(nums, 2);
  print("Delete element at index 2, get nums = $nums");

  /* Traverse array */
  traverse(nums);

  /* Find element */
  int index = find(nums, 3);
  print("Find element 3 in nums, index = $index");
}
