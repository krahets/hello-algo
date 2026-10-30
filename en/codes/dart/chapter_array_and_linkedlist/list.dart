/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Driver code */
void main() {
  /* Initialize the list */
  List<int> nums = [1, 3, 2, 5, 4];
  print('List nums = $nums');

  /* Access an element */
  int _num = nums[1];
  print('Access the element at index 1: _num = $_num');

  /* Update an element */
  nums[1] = 0;
  print('After updating the element at index 1 to 0, nums = $nums');

  /* Clear the list */
  nums.clear();
  print('After clearing the list, nums = $nums');

  /* Append an element at the end */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print('After adding elements, nums = $nums');

  /* Insert an element in the middle */
  nums.insert(3, 6);
  print('After inserting 6 at index 3, nums = $nums');

  /* Remove an element */
  nums.removeAt(3);
  print('After removing the element at index 3, nums = $nums');

  /* Traverse the list by index */
  int count = 0;
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  /* Iterate directly over the list elements */
  count = 0;
  for (var x in nums) {
    count += x;
  }

  /* Concatenate two lists */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1);
  print('After appending list nums1 to nums, nums = $nums');

  /* Sort the list */
  nums.sort();
  print('After sorting the list, nums = $nums');
}
