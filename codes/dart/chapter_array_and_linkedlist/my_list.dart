/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
class MyList {
  late List<int> _nums;

  int _capacity = 10;

  int _size = 0;

  int _extendRatio = 2;

  MyList() {
    _nums = List.filled(_capacity, 0);
  }

  int size() => _size;

  int capacity() => _capacity;

  int get(int index) {
    if (index >= _size) throw RangeError('索引越界');
    return _nums[index];
  }

  void set(int index, int num) {
    if (index >= _size) throw RangeError('索引越界');
    _nums[index] = num;
  }

  void add(int num) {
    if (_size == _capacity) extendCapacity();
    _nums[_size] = num;
    _size++;
  }

  void insert(int index, int num) {
    if (index >= _size) throw RangeError('索引越界');
    if (_size == _capacity) extendCapacity();
    for (var j = _size - 1; j >= index; j--) {
      _nums[j + 1] = _nums[j];
    }
    _nums[index] = num;
    _size++;
  }

  int remove(int index) {
    if (index >= _size) throw RangeError('索引越界');
    int num = _nums[index];

    for (var j = index; j < _size - 1; j++) {
      _nums[j] = _nums[j + 1];
    }
    _size--;
    return num;
  }

  void extendCapacity() {
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    List.copyRange(_newNums, 0, _nums);
    _nums = _newNums;
    _capacity = _nums.length;
  }
  
  List<int> toArray() {
    List<int> nums = [];
    for (var i = 0; i < _size; i++) {
      nums.add(get(i));
    }
    return nums;
  }
}

int main() {
  /* 初始化列表 */
  MyList list = MyList();
  /* 尾部添加元素 */
  list.add(1);
  list.add(3);
  list.add(2);
  list.add(5);
  list.add(4);
  print('列表 list = ${list.toArray()}，容量 =  ${list.capacity()}，长度 = ${list.size()}');

  /* 中间插入元素 */
  list.insert(3, 6);
  print('在索引 3 处插入数字 6 ，得到 list =  ${list.toArray()}');

  /* 删除元素 */
  list.remove(3);
  print('删除索引 3 处的元素，得到 list = ${list.toArray()}');

  /* 访问元素 */
  int num = list.get(1);
  print('访问索引 1 处的元素，得到 num =  $num');

  /* 更新元素 */
  list.set(1, 0);
  print('将索引 1 处的元素更新为 0 ，得到 list =  ${list.toArray()}');

  /* 测试扩容机制 */
  for (var i = 0; i < 10; i++) {
    // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
    list.add(i);
  }
  print('扩容后的列表 list = ${list.toArray()}，容量 = ${list.capacity()}  ，长度 = ${list.size()}');
  return 0;
}
