/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Driver Code */
void main() {
  // [region]{init_list}
  /* 初始化串列 */
  // 無初始值
  List<int> emptyNums = [];
  // 有初始值
  List<int> nums = [1, 3, 2, 5, 4];
  // [endregion]{init_list}
  print('串列 nums = $nums');
  print('串列 emptyNums = $emptyNums');

  // [region]{access_element}
  /* 訪問元素 */
  int _num = nums[1]; // 訪問索引 1 處的元素
  // [endregion]{access_element}
  print('訪問索引 1 處的元素，得到 _num = $_num');

  // [region]{update_element}
  /* 更新元素 */
  nums[1] = 0; // 將索引 1 處的元素更新為 0
  // [endregion]{update_element}
  print('將索引 1 處的元素更新為 0 ，得到 nums = $nums');

  // [region]{clear_list}
  /* 清空串列 */
  nums.clear();
  // [endregion]{clear_list}
  print('清空串列後 nums = $nums');

  // [region]{append_element}
  /* 在尾部新增元素 */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  // [endregion]{append_element}
  print('新增元素後 nums = $nums');

  // [region]{insert_element}
  /* 在中間插入元素 */
  nums.insert(3, 6); // 在索引 3 處插入數字 6
  // [endregion]{insert_element}
  print('在索引 3 處插入數字 6 ，得到 nums = $nums');

  // [region]{remove_element}
  /* 刪除元素 */
  nums.removeAt(3); // 刪除索引 3 處的元素
  // [endregion]{remove_element}
  print('刪除索引 3 處的元素，得到 nums = $nums');

  // [region]{iterate_list}
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
  // [endregion]{iterate_list}

  // [region]{concat_list}
  /* 拼接兩個串列 */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1); // 將串列 nums1 拼接到 nums 之後
  // [endregion]{concat_list}
  print('將串列 nums1 拼接到 nums 之後，得到 nums = $nums');

  // [region]{sort_list}
  /* 排序串列 */
  nums.sort(); // 排序後，串列元素從小到大排列
  // [endregion]{sort_list}
  print('排序串列後 nums = $nums');
}
