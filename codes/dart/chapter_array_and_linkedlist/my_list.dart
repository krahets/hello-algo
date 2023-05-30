/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 列表类简易实现 */
class MyList {
  late List<int> _nums; // 数组（存储列表元素）
  int _capacity = 10; // 列表容量
  int _size = 0; // 列表长度（即当前元素数量）
  int _extendRatio = 2; // 每次列表扩容的倍数

  /* 构造方法 */
  MyList() {
    _nums = List.filled(_capacity, 0);
  }

  /* 获取列表长度（即当前元素数量）*/
  int size() => _size;

  /* 获取列表容量 */
  int capacity() => _capacity;

  /* 访问元素 */
  int get(int index) {
    if (index >= _size) throw RangeError('索引越界');
    return _nums[index];
  }

  /* 更新元素 */
  void set(int index, int num) {
    if (index >= _size) throw RangeError('索引越界');
    _nums[index] = num;
  }

  /* 尾部添加元素 */
  void add(int num) {
    // 元素数量超出容量时，触发扩容机制
    if (_size == _capacity) extendCapacity();
    _nums[_size] = num;
    // 更新元素数量
    _size++;
  }

  /* 中间插入元素 */
  void insert(int index, int num) {
    if (index >= _size) throw RangeError('索引越界');
    // 元素数量超出容量时，触发扩容机制
    if (_size == _capacity) extendCapacity();
    // 将索引 index 以及之后的元素都向后移动一位
    for (var j = _size - 1; j >= index; j--) {
      _nums[j + 1] = _nums[j];
    }
    _nums[index] = num;
    // 更新元素数量
    _size++;
  }

  /* 删除元素 */
  int remove(int index) {
    if (index >= _size) throw RangeError('索引越界');
    int num = _nums[index];
    // 将索引 index 之后的元素都向前移动一位
    for (var j = index; j < _size - 1; j++) {
      _nums[j] = _nums[j + 1];
    }
    // 更新元素数量
    _size--;
    // 返回被删除元素
    return num;
  }

  /* 列表扩容 */
  void extendCapacity() {
    // 新建一个长度为 _capacity * _extendRatio 的数组
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // 将原数组拷贝到新数组
    List.copyRange(_newNums, 0, _nums);
    // 更新 _nums 的引用
    _nums = _newNums;
    // 更新列表容量
    _capacity = _nums.length;
  }

  /* 将列表转换为数组 */
  List<int> toArray() {
    List<int> nums = [];
    for (var i = 0; i < _size; i++) {
      nums.add(get(i));
    }
    return nums;
  }
}

/* Driver Code */
int main() {
  /* 初始化列表 */
  MyList list = MyList();
  /* 尾部添加元素 */
  list.add(1);
  list.add(3);
  list.add(2);
  list.add(5);
  list.add(4);
  print(
      '列表 list = ${list.toArray()} ，容量 = ${list.capacity()} ，长度 = ${list.size()}');

  /* 中间插入元素 */
  list.insert(3, 6);
  print('在索引 3 处插入数字 6 ，得到 list = ${list.toArray()}');

  /* 删除元素 */
  list.remove(3);
  print('删除索引 3 处的元素，得到 list = ${list.toArray()}');

  /* 访问元素 */
  int num = list.get(1);
  print('访问索引 1 处的元素，得到 num = $num');

  /* 更新元素 */
  list.set(1, 0);
  print('将索引 1 处的元素更新为 0 ，得到 list = ${list.toArray()}');

  /* 测试扩容机制 */
  for (var i = 0; i < 10; i++) {
    // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
    list.add(i);
  }
  print(
      '扩容后的列表 list = ${list.toArray()} ，容量 = ${list.capacity()} ，长度 = ${list.size()}');

  return 0;
}
