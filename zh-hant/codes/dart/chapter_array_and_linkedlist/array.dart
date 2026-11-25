/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* 隨機存取元素 */
int randomAccess(List<int> nums) {
  // 從區間 [0, nums.length) 隨機選取一個數
  int randomIndex = Random().nextInt(nums.length);
  // 取得並回傳隨機選出的元素
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* 增加陣列長度 */
List<int> extend(List<int> nums, int enlarge) {
  // 初始化加長後的陣列
  List<int> res = List.filled(nums.length + enlarge, 0);
  // 將原陣列的所有元素複製到新陣列
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // 回傳加長後的新陣列
  return res;
}

/* 在陣列的索引 index 處插入元素 _num */
void insert(List<int> nums, int _num, int index) {
  // 將索引 index 起的所有元素往後移一格
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // 將 _num 指派給索引 index 處的元素
  nums[index] = _num;
}

/* 刪除索引 index 處的元素 */
void remove(List<int> nums, int index) {
  // 將索引 index 之後的所有元素往前移一格
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* 走訪陣列中的元素 */
void traverse(List<int> nums) {
  int count = 0;
  // 依索引走訪陣列
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // 直接走訪陣列中的元素
  for (int _num in nums) {
    count += _num;
  }
  // 以 forEach 方法走訪陣列
  nums.forEach((_num) {
    count += _num;
  });
}

/* 在陣列中尋找指定元素 */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* 範例主程式 */
void main() {
  /* 初始化陣列 */
  var arr = List.filled(5, 0);
  print('陣列 arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('陣列 nums = $nums');

  /* 隨機存取 */
  int randomNum = randomAccess(nums);
  print('從 nums 隨機取得的元素為 $randomNum');

  /* 增加長度 */
  nums = extend(nums, 3);
  print('將陣列長度增加至 8，得到 nums = $nums');

  /* 插入元素 */
  insert(nums, 6, 3);
  print("在索引 3 處插入數字 6，得到 nums = $nums");

  /* 刪除元素 */
  remove(nums, 2);
  print("刪除索引 2 處的元素，得到 nums = $nums");

  /* 走訪陣列 */
  traverse(nums);

  /* 尋找元素 */
  int index = find(nums, 3);
  print("在 nums 中尋找元素 3，得到索引 = $index");
}
