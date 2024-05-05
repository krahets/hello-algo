/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* Random access to elements */
int randomAccess(List<int> nums) {
  // Randomly select a number in the interval [0, nums.length)
  int randomIndex = Random().nextInt(nums.length);
  // Retrieve and return a random element
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* Extend array length */
List<int> extend(List<int> nums, int enlarge) {
  // Initialize an extended length array
  List<int> res = List.filled(nums.length + enlarge, 0);
  // Copy all elements from the original array to the new array
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // Return the new array after expansion
  return res;
}

/* Insert element _num at index in the array */
void insert(List<int> nums, int _num, int index) {
  // Move all elements after `index` one position backward
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // Assign _num to the element at index
  nums[index] = _num;
}

/* Remove the element at `index` */
void remove(List<int> nums, int index) {
  // Move all elements after `index` one position forward
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* Iterate over array elements */
void traverse(List<int> nums) {
  int count = 0;
  // Traverse array by index
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // Traverse array elements
  for (int _num in nums) {
    count += _num;
  }
  // Iterate over array using forEach method
  nums.forEach((_num) {
    count += _num;
  });
}

/* Search for a specified element in the array */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* Driver Code */
void main() {
  /* Initialize an array */
  var arr = List.filled(5, 0);
  print('数组 arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('数组 nums = $nums');

  /* Random access */
  int randomNum = randomAccess(nums);
  print('在 nums 中获取随机元素 $randomNum');

  /* Length extension */
  nums = extend(nums, 3);
  print('将数组长度扩展至 8 ，得到 nums = $nums');

  /* Insert element */
  insert(nums, 6, 3);
  print("Insert number 6 at index 3, resulting in nums = $nums");

  /* Remove element */
  remove(nums, 2);
  print("Remove the element at index 2, resulting in nums = $nums");

  /* Traverse array */
  traverse(nums);

  /* Search for elements */
  int index = find(nums, 3);
  print("Find element 3 in nums, index = $index");
}
