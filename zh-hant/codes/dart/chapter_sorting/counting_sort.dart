/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* 計數排序 */
// 簡單實現，無法用於排序物件
void countingSortNaive(List<int> nums) {
  // 1. 統計陣列最大元素 m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. 統計各數字的出現次數
  // counter[_num] 代表 _num 的出現次數
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. 走訪 counter ，將各元素填入原陣列 nums
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* 計數排序 */
// 完整實現，可排序物件，並且是穩定排序
void countingSort(List<int> nums) {
  // 1. 統計陣列最大元素 m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. 統計各數字的出現次數
  // counter[_num] 代表 _num 的出現次數
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. 求 counter 的前綴和，將“出現次數”轉換為“尾索引”
  // 即 counter[_num]-1 是 _num 在 res 中最後一次出現的索引
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. 倒序走訪 nums ，將各元素填入結果陣列 res
  // 初始化陣列 res 用於記錄結果
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // 將 _num 放置到對應索引處
    counter[_num]--; // 令前綴和自減 1 ，得到下次放置 _num 的索引
  }
  // 使用結果陣列 res 覆蓋原陣列 nums
  nums.setAll(0, res);
}

/* Driver Code*/
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('計數排序（無法排序物件）完成後 nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('計數排序完成後 nums1 = $nums1');
}
