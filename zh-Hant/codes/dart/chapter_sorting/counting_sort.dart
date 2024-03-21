/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* 计数排序 */
// 简单实现，无法用于排序对象
void countingSortNaive(List<int> nums) {
  // 1. 统计数组最大元素 m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. 统计各数字的出现次数
  // counter[_num] 代表 _num 的出现次数
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. 遍历 counter ，将各元素填入原数组 nums
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* 计数排序 */
// 完整实现，可排序对象，并且是稳定排序
void countingSort(List<int> nums) {
  // 1. 统计数组最大元素 m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. 统计各数字的出现次数
  // counter[_num] 代表 _num 的出现次数
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
  // 即 counter[_num]-1 是 _num 在 res 中最后一次出现的索引
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. 倒序遍历 nums ，将各元素填入结果数组 res
  // 初始化数组 res 用于记录结果
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // 将 _num 放置到对应索引处
    counter[_num]--; // 令前缀和自减 1 ，得到下次放置 _num 的索引
  }
  // 使用结果数组 res 覆盖原数组 nums
  nums.setAll(0, res);
}

/* Driver Code*/
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('计数排序（无法排序对象）完成后 nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('计数排序完成后 nums1 = $nums1');
}
