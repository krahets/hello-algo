/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Driver Code */
int main() {
  /* 初始化列表 */
  List<int> list = [1, 3, 2, 5, 4];
  print('列表 list = $list');

  /* 访问元素 */
  int num = list[1];
  print('访问索引 1 处的元素，得到 num = $num');

  /* 更新元素 */
  list[1] = 0;
  print('将索引 1 处的元素更新为 0 ，得到 list = $list');

  /* 清空列表 */
  list.clear();
  print('清空列表后 list = $list');

  /* 尾部添加元素 */
  list.add(1);
  list.add(3);
  list.add(2);
  list.add(5);
  list.add(4);
  print('添加元素后 list = $list');

  /* 中间插入元素 */
  list.insert(3, 6);
  print('在索引 3 处插入数字 6 ，得到 list = $list');

  /* 删除元素 */
  list.removeAt(3);
  print('删除索引 3 处的元素，得到 list = $list');

  /* 通过索引遍历列表 */
  int count = 0;
  for (var i = 0; i < list.length; i++) {
    count++;
  }
  /* 直接遍历列表元素 */
  count = 0;
  for (var n in list) {
    count++;
  }

  /* 拼接两个列表 */
  List<int> list1 = [6, 8, 7, 10, 9];
  list.addAll(list1);
  print('将列表 list1 拼接到 list 之后，得到 list = $list');

  /* 排序列表 */
  list.sort();
  print('排序列表后 list = $list');

  return 0;
}
