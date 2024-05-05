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
  print('列表 nums = $nums');

  /* Access element */
  int _num = nums[1];
  print('访问索引 1 处的元素，得到 _num = $_num');

  /* Update element */
  nums[1] = 0;
  print('将索引 1 处的元素更新为 0 ，得到 nums = $nums');

  /* Clear list */
  nums.clear();
  print('清空列表后 nums = $nums');

  /* Add element at the end */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print('添加元素后 nums = $nums');

  /* Insert element in the middle */
  nums.insert(3, 6);
  print('在索引 3 处插入数字 6 ，得到 nums = $nums');

  /* Remove element */
  nums.removeAt(3);
  print('删除索引 3 处的元素，得到 nums = $nums');

  /* Traverse the list by index */
  int count = 0;
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  /* Traverse the list elements */
  count = 0;
  for (var x in nums) {
    count += x;
  }

  /* Concatenate two lists */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1);
  print('将列表 nums1 拼接到 nums 之后，得到 nums = $nums');

  /* Sort list */
  nums.sort();
  print('排序列表后 nums = $nums');
}
