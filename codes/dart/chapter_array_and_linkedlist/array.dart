/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* 随机访问元素 */
int randomAccess(List<int> nums) {
  // 在区间 [0, nums.length) 中随机抽取一个数字
  int randomIndex = Random().nextInt(nums.length);
  // 获取并返回随机元素
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* 扩展数组长度 */
List<int> extend(List<int> nums, int enlarge) {
  // 初始化一个扩展长度后的数组
  List<int> res = List.filled(nums.length + enlarge, 0);
  // 将原数组中的所有元素复制到新数组
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // 返回扩展后的新数组
  return res;
}

/* 在数组的索引 index 处插入元素 _num */
void insert(List<int> nums, int _num, int index) {
  // 把索引 index 以及之后的所有元素向后移动一位
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // 将 _num 赋给 index 处元素
  nums[index] = _num;
}

/* 删除索引 index 处的元素 */
void remove(List<int> nums, int index) {
  // 把索引 index 之后的所有元素向前移动一位
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* 遍历数组元素 */
void traverse(List<int> nums) {
  int count = 0;
  // 通过索引遍历数组
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // 直接遍历数组元素
  for (int _num in nums) {
    count += _num;
  }
  // 通过 forEach 方法遍历数组
  nums.forEach((_num) {
    count += _num;
  });
}

/* 在数组中查找指定元素 */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* Driver Code */
void main() {
  /* 初始化数组 */
  var arr = List.filled(5, 0);
  print('数组 arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('数组 nums = $nums');

  /* 随机访问 */
  int randomNum = randomAccess(nums);
  print('在 nums 中获取随机元素 $randomNum');

  /* 长度扩展 */
  nums = extend(nums, 3);
  print('将数组长度扩展至 8 ，得到 nums = $nums');

  /* 插入元素 */
  insert(nums, 6, 3);
  print("在索引 3 处插入数字 6 ，得到 nums = $nums");

  /* 删除元素 */
  remove(nums, 2);
  print("删除索引 2 处的元素，得到 nums = $nums");

  /* 遍历数组 */
  traverse(nums);

  /* 查找元素 */
  int index = find(nums, 3);
  print("在 nums 中查找元素 3 ，得到索引 = $index");
}
