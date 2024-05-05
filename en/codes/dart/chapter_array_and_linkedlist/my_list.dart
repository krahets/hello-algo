/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* List class */
class MyList {
  late List<int> _arr; // Array (stores list elements)
  int _capacity = 10; // List capacity
  int _size = 0; // List length (current number of elements)
  int _extendRatio = 2; // Multiple for each list expansion

  /* Constructor */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* Get list length (current number of elements)*/
  int size() => _size;

  /* Get list capacity */
  int capacity() => _capacity;

  /* Access element */
  int get(int index) {
    if (index >= _size) throw RangeError('索引越界');
    return _arr[index];
  }

  /* Update element */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('索引越界');
    _arr[index] = _num;
  }

  /* Add element at the end */
  void add(int _num) {
    // When the number of elements exceeds capacity, trigger the expansion mechanism
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // Update the number of elements
    _size++;
  }

  /* Insert element in the middle */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('索引越界');
    // When the number of elements exceeds capacity, trigger the expansion mechanism
    if (_size == _capacity) extendCapacity();
    // Move all elements after `index` one position backward
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // Update the number of elements
    _size++;
  }

  /* Remove element */
  int remove(int index) {
    if (index >= _size) throw RangeError('索引越界');
    int _num = _arr[index];
    // Move all elements after `index` one position forward
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // Update the number of elements
    _size--;
    // Return the removed element
    return _num;
  }

  /* Extend list */
  void extendCapacity() {
    // Create a new array with length _extendRatio times the original array
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // Copy the original array to the new array
    List.copyRange(_newNums, 0, _arr);
    // Update the reference of _arr
    _arr = _newNums;
    // Update list capacity
    _capacity = _arr.length;
  }

  /* Convert the list to an array */
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
  /* Initialize list */
  MyList nums = MyList();
  /* Add element at the end */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print(
      '列表 nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，长度 = ${nums.size()}');

  /* Insert element in the middle */
  nums.insert(3, 6);
  print('在索引 3 处插入数字 6 ，得到 nums = ${nums.toArray()}');

  /* Remove element */
  nums.remove(3);
  print('删除索引 3 处的元素，得到 nums = ${nums.toArray()}');

  /* Access element */
  int _num = nums.get(1);
  print('访问索引 1 处的元素，得到 _num = $_num');

  /* Update element */
  nums.set(1, 0);
  print('将索引 1 处的元素更新为 0 ，得到 nums = ${nums.toArray()}');

  /* Test expansion mechanism */
  for (var i = 0; i < 10; i++) {
    // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism at this time
    nums.add(i);
  }
  print(
      '扩容后的列表 nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，长度 = ${nums.size()}');
}
