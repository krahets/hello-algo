/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Driver Code */
void main() {
  /* Initialize list */
  List<int> nums = [1, 3, 2, 5, 4];
  print('List nums = $nums');

  /* Update element */
  int _num = nums[1];
  print('Access element at index 1, get _num = $_num');

  /* Add elements at the end */
  nums[1] = 0;
  print('Update element at index 1 to 0, get nums = $nums');

  /* Remove element */
  nums.clear();
  print('After clearing list, nums = $nums');

  /* Direct traversal of list elements */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print('After adding elements, nums = $nums');

  /* Sort list */
  nums.insert(3, 6);
  print('Insert number 6 at index 3, get nums = $nums');

  /* Remove element */
  nums.removeAt(3);
  print('Delete element at index 3, get nums = $nums');

  /* Traverse list by index */
  int count = 0;
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  /* Directly traverse list elements */
  count = 0;
  for (var x in nums) {
    count += x;
  }

  /* Concatenate two lists */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1);
  print('After concatenating list nums1 to nums, get nums = $nums');

  /* Sort list */
  nums.sort();
  print('After sorting list, nums = $nums');
}
