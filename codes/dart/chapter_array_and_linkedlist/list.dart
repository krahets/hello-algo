/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Driver Code */
void main() {
  // [region]{init_list}
  /* 初始化列表 */
  // 无初始值
  List<int> emptyNums = [];
  // 有初始值
  List<int> nums = [1, 3, 2, 5, 4];
  // [endregion]{init_list}
  print('列表 nums = $nums');
  print('列表 emptyNums = $emptyNums');

  // [region]{access_element}
  /* 访问元素 */
  int _num = nums[1]; // 访问索引 1 处的元素
  // [endregion]{access_element}
  print('访问索引 1 处的元素，得到 _num = $_num');

  // [region]{update_element}
  /* 更新元素 */
  nums[1] = 0; // 将索引 1 处的元素更新为 0
  // [endregion]{update_element}
  print('将索引 1 处的元素更新为 0 ，得到 nums = $nums');

  // [region]{clear_list}
  /* 清空列表 */
  nums.clear();
  // [endregion]{clear_list}
  print('清空列表后 nums = $nums');

  // [region]{append_element}
  /* 在尾部添加元素 */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  // [endregion]{append_element}
  print('添加元素后 nums = $nums');

  // [region]{insert_element}
  /* 在中间插入元素 */
  nums.insert(3, 6); // 在索引 3 处插入数字 6
  // [endregion]{insert_element}
  print('在索引 3 处插入数字 6 ，得到 nums = $nums');

  // [region]{remove_element}
  /* 删除元素 */
  nums.removeAt(3); // 删除索引 3 处的元素
  // [endregion]{remove_element}
  print('删除索引 3 处的元素，得到 nums = $nums');

  // [region]{iterate_list}
  /* 通过索引遍历列表 */
  int count = 0;
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }

  /* 直接遍历列表元素 */
  count = 0;
  for (var x in nums) {
    count += x;
  }
  // [endregion]{iterate_list}

  // [region]{concat_list}
  /* 拼接两个列表 */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1); // 将列表 nums1 拼接到 nums 之后
  // [endregion]{concat_list}
  print('将列表 nums1 拼接到 nums 之后，得到 nums = $nums');

  // [region]{sort_list}
  /* 排序列表 */
  nums.sort(); // 排序后，列表元素从小到大排列
  // [endregion]{sort_list}
  print('排序列表后 nums = $nums');
}
