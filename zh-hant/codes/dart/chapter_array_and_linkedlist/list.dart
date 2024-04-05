/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Driver Code */
void main() {
  /* 初始化串列 */
  List<int> nums = [1, 3, 2, 5, 4];
  print('串列 nums = $nums');

  /* 訪問元素 */
  int _num = nums[1];
  print('訪問索引 1 處的元素，得到 _num = $_num');

  /* 更新元素 */
  nums[1] = 0;
  print('將索引 1 處的元素更新為 0 ，得到 nums = $nums');

  /* 清空串列 */
  nums.clear();
  print('清空串列後 nums = $nums');

  /* 在尾部新增元素 */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print('新增元素後 nums = $nums');

  /* 在中間插入元素 */
  nums.insert(3, 6);
  print('在索引 3 處插入數字 6 ，得到 nums = $nums');

  /* 刪除元素 */
  nums.removeAt(3);
  print('刪除索引 3 處的元素，得到 nums = $nums');

  /* 透過索引走訪串列 */
  int count = 0;
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  /* 直接走訪串列元素 */
  count = 0;
  for (var x in nums) {
    count += x;
  }

  /* 拼接兩個串列 */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1);
  print('將串列 nums1 拼接到 nums 之後，得到 nums = $nums');

  /* 排序串列 */
  nums.sort();
  print('排序串列後 nums = $nums');
}
