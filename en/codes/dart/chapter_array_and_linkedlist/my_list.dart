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
  int _extendRatio = 2; // Multiple by which the list capacity is extended each time

  /* Constructor */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* Get list length (current number of elements) */
  int size() => _size;

  /* Get list capacity */
  int capacity() => _capacity;

  /* Update element */
  int get(int index) {
    if (index >= _size) throw RangeError('Index out of bounds');
    return _arr[index];
  }

  /* Add elements at the end */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('Index out of bounds');
    _arr[index] = _num;
  }

  /* Direct traversal of list elements */
  void add(int _num) {
    // When the number of elements exceeds capacity, trigger the extension mechanism
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // Update the number of elements
    _size++;
  }

  /* Sort list */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('Index out of bounds');
    // When the number of elements exceeds capacity, trigger the extension mechanism
    if (_size == _capacity) extendCapacity();
    // Move all elements after index index forward by one position
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // Update the number of elements
    _size++;
  }

  /* Remove element */
  int remove(int index) {
    if (index >= _size) throw RangeError('Index out of bounds');
    int _num = _arr[index];
    // Move all elements after index forward by one position
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // Update the number of elements
    _size--;
    // Return the removed element
    return _num;
  }

  /* Driver Code */
  void extendCapacity() {
    // Create new array with length _extendRatio times original array
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // Copy original array to new array
    List.copyRange(_newNums, 0, _arr);
    // Update _arr reference
    _arr = _newNums;
    // Add elements at the end
    _capacity = _arr.length;
  }

  /* Convert list to array */
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
  /* Direct traversal of list elements */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print(
      'List nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}');

  /* Sort list */
  nums.insert(3, 6);
  print('Insert number 6 at index 3, get nums = ${nums.toArray()}');

  /* Remove element */
  nums.remove(3);
  print('Delete element at index 3, get nums = ${nums.toArray()}');

  /* Update element */
  int _num = nums.get(1);
  print('Access element at index 1, get _num = $_num');

  /* Add elements at the end */
  nums.set(1, 0);
  print('Update element at index 1 to 0, get nums = ${nums.toArray()}');

  /* Test capacity expansion mechanism */
  for (var i = 0; i < 10; i++) {
    // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism
    nums.add(i);
  }
  print(
      'After expansion, list nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}');
}
