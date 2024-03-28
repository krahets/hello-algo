/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* 隨機訪問元素 */
int randomAccess(List<int> nums) {
  // 在區間 [0, nums.length) 中隨機抽取一個數字
  int randomIndex = Random().nextInt(nums.length);
  // 獲取並返回隨機元素
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* 擴展陣列長度 */
List<int> extend(List<int> nums, int enlarge) {
  // 初始化一個擴展長度後的陣列
  List<int> res = List.filled(nums.length + enlarge, 0);
  // 將原陣列中的所有元素複製到新陣列
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // 返回擴展後的新陣列
  return res;
}

/* 在陣列的索引 index 處插入元素 _num */
void insert(List<int> nums, int _num, int index) {
  // 把索引 index 以及之後的所有元素向後移動一位
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // 將 _num 賦給 index 處元素
  nums[index] = _num;
}

/* 刪除索引 index 處的元素 */
void remove(List<int> nums, int index) {
  // 把索引 index 之後的所有元素向前移動一位
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* 走訪陣列元素 */
void traverse(List<int> nums) {
  int count = 0;
  // 透過索引走訪陣列
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // 直接走訪陣列元素
  for (int _num in nums) {
    count += _num;
  }
  // 透過 forEach 方法走訪陣列
  nums.forEach((_num) {
    count += _num;
  });
}

/* 在陣列中查詢指定元素 */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* Driver Code */
void main() {
  /* 初始化陣列 */
  var arr = List.filled(5, 0);
  print('陣列 arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('陣列 nums = $nums');

  /* 隨機訪問 */
  int randomNum = randomAccess(nums);
  print('在 nums 中獲取隨機元素 $randomNum');

  /* 長度擴展 */
  nums = extend(nums, 3);
  print('將陣列長度擴展至 8 ，得到 nums = $nums');

  /* 插入元素 */
  insert(nums, 6, 3);
  print("在索引 3 處插入數字 6 ，得到 nums = $nums");

  /* 刪除元素 */
  remove(nums, 2);
  print("刪除索引 2 處的元素，得到 nums = $nums");

  /* 走訪陣列 */
  traverse(nums);

  /* 查詢元素 */
  int index = find(nums, 3);
  print("在 nums 中查詢元素 3 ，得到索引 = $index");
}
