/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 列表类 */
class MyList {
  late List<int> _arr; // 数组（存储列表元素）
  int _capacity = 10; // 列表容量
  int _size = 0; // 列表长度（当前元素数量）
  int _extendRatio = 2; // 每次列表扩容的倍数

  /* 构造方法 */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* 获取列表长度（当前元素数量）*/
  int size() => _size;

  /* 获取列表容量 */
  int capacity() => _capacity;

  /* 访问元素 */
  int get(int index) {
    if (index >= _size) throw RangeError('索引越界');
    return _arr[index];
  }

  /* 更新元素 */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('索引越界');
    _arr[index] = _num;
  }

  /* 在尾部添加元素 */
  void add(int _num) {
    // 元素数量超出容量时，触发扩容机制
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // 更新元素数量
    _size++;
  }

  /* 在中间插入元素 */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('索引越界');
    // 元素数量超出容量时，触发扩容机制
    if (_size == _capacity) extendCapacity();
    // 将索引 index 以及之后的元素都向后移动一位
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // 更新元素数量
    _size++;
  }

  /* 删除元素 */
  int remove(int index) {
    if (index >= _size) throw RangeError('索引越界');
    int _num = _arr[index];
    // 将将索引 index 之后的元素都向前移动一位
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // 更新元素数量
    _size--;
    // 返回被删除的元素
    return _num;
  }

  /* 列表扩容 */
  void extendCapacity() {
    // 新建一个长度为原数组 _extendRatio 倍的新数组
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // 将原数组复制到新数组
    List.copyRange(_newNums, 0, _arr);
    // 更新 _arr 的引用
    _arr = _newNums;
    // 更新列表容量
    _capacity = _arr.length;
  }

  /* 将列表转换为数组 */
  List<int> toArray() {
    List<int> arr = [];
    for (var i = 0; i < _size; i++) {
      arr.add(get(i));
    }
    return arr;
  }
}

/* Driver Code */
void main() {
  /* 初始化列表 */
  MyList nums = MyList();
  /* 在尾部添加元素 */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print(
      '列表 nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，长度 = ${nums.size()}');

  /* 在中间插入元素 */
  nums.insert(3, 6);
  print('在索引 3 处插入数字 6 ，得到 nums = ${nums.toArray()}');

  /* 删除元素 */
  nums.remove(3);
  print('删除索引 3 处的元素，得到 nums = ${nums.toArray()}');

  /* 访问元素 */
  int _num = nums.get(1);
  print('访问索引 1 处的元素，得到 _num = $_num');

  /* 更新元素 */
  nums.set(1, 0);
  print('将索引 1 处的元素更新为 0 ，得到 nums = ${nums.toArray()}');

  /* 测试扩容机制 */
  for (var i = 0; i < 10; i++) {
    // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
    nums.add(i);
  }
  print(
      '扩容后的列表 nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，长度 = ${nums.size()}');
}
