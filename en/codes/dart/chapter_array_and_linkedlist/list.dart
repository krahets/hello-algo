/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Driver code */
void main() {
  // [region]{init_list}
  /* Initialize the list */
  // Without initial values
  List<int> emptyNums = [];
  // With initial values
  List<int> nums = [1, 3, 2, 5, 4];
  // [endregion]{init_list}
  print('List nums = $nums');
  print('List emptyNums = $emptyNums');

  // [region]{access_element}
  /* Access an element */
  int _num = nums[1]; // Access the element at index 1
  // [endregion]{access_element}
  print('Access the element at index 1: _num = $_num');

  // [region]{update_element}
  /* Update an element */
  nums[1] = 0; // Update the element at index 1 to 0
  // [endregion]{update_element}
  print('After updating the element at index 1 to 0, nums = $nums');

  // [region]{clear_list}
  /* Clear the list */
  nums.clear();
  // [endregion]{clear_list}
  print('After clearing the list, nums = $nums');

  // [region]{append_element}
  /* Append an element at the end */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  // [endregion]{append_element}
  print('After adding elements, nums = $nums');

  // [region]{insert_element}
  /* Insert an element in the middle */
  nums.insert(3, 6); // Insert the number 6 at index 3
  // [endregion]{insert_element}
  print('After inserting 6 at index 3, nums = $nums');

  // [region]{remove_element}
  /* Remove an element */
  nums.removeAt(3); // Remove the element at index 3
  // [endregion]{remove_element}
  print('After removing the element at index 3, nums = $nums');

  // [region]{iterate_list}
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
  // [endregion]{iterate_list}

  // [region]{concat_list}
  /* Concatenate two lists */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1); // Append list nums1 to nums
  // [endregion]{concat_list}
  print('After appending list nums1 to nums, nums = $nums');

  // [region]{sort_list}
  /* Sort the list */
  nums.sort(); // After sorting, the list elements are in ascending order
  // [endregion]{sort_list}
  print('After sorting the list, nums = $nums');
}
