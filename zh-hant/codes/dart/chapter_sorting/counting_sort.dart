/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* 計數排序 */
// 簡易實作，無法用來將物件排序
void countingSortNaive(List<int> nums) {
  // 1. 找出陣列中的最大元素 m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. 統計各數字出現的次數
  // counter[_num] 代表 _num 出現的次數
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. 走訪 counter，將各元素填入原陣列 nums
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* 計數排序 */
// 完整實作，可將物件排序，且屬於穩定排序
void countingSort(List<int> nums) {
  // 1. 找出陣列中的最大元素 m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. 統計各數字出現的次數
  // counter[_num] 代表 _num 出現的次數
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. 計算 counter 的前綴和，將「出現次數」轉為「結尾索引」
  // 也就是說，counter[_num]-1 是 _num 在 res 中最後一次出現的索引
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. 反向走訪 nums，將各元素填入結果陣列 res
  // 初始化陣列 res，用來記錄結果
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // 將 _num 放到對應索引的位置
    counter[_num]--; // 將前綴和減 1，取得下次放置 _num 時所需的索引
  }
  // 用結果陣列 res 覆寫原陣列 nums
  nums.setAll(0, res);
}

/* 主程式*/
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('計數排序（無法將物件排序）完成後 nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('計數排序完成後 nums1 = $nums1');
}
