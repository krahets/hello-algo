/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* List class */
class MyList {
  late List<int> _arr; // Array that stores the list elements
  int _capacity = 10; // List capacity
  int _size = 0; // List length (current number of elements)
  int _extendRatio = 2; // Factor by which the list capacity grows

  /* Constructor */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* Get the list length (current number of elements)*/
  int size() => _size;

  /* Get the list capacity */
  int capacity() => _capacity;

  /* Access an element */
  int get(int index) {
    if (index >= _size) throw RangeError('Index out of bounds');
    return _arr[index];
  }

  /* Update an element */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('Index out of bounds');
    _arr[index] = _num;
  }

  /* Append an element */
  void add(int _num) {
    // Increase capacity when the elements would no longer fit
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // Update the element count
    _size++;
  }

  /* Insert an element in the middle */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('Index out of bounds');
    // Increase capacity when the elements would no longer fit
    if (_size == _capacity) extendCapacity();
    // Shift the elements from index onward one position to the right
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // Update the element count
    _size++;
  }

  /* Remove an element */
  int remove(int index) {
    if (index >= _size) throw RangeError('Index out of bounds');
    int _num = _arr[index];
    // Shift the elements after index one position to the left
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // Update the element count
    _size--;
    // Return the removed element
    return _num;
  }

  /* Increase the list capacity */
  void extendCapacity() {
    // Create an array whose length is _extendRatio times the original length
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // Copy the original array into the new array
    List.copyRange(_newNums, 0, _arr);
    // Update the reference in _arr
    _arr = _newNums;
    // Update the list capacity
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
  /* Initialize the list */
  MyList nums = MyList();
  /* Append an element */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print(
      'List nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}');

  /* Insert an element in the middle */
  nums.insert(3, 6);
  print('After inserting 6 at index 3, nums = ${nums.toArray()}');

  /* Remove an element */
  nums.remove(3);
  print('After removing the element at index 3, nums = ${nums.toArray()}');

  /* Access an element */
  int _num = nums.get(1);
  print('Reading index 1 gives _num = $_num');

  /* Update an element */
  nums.set(1, 0);
  print('After setting the element at index 1 to 0, nums = ${nums.toArray()}');

  /* Test capacity growth */
  for (var i = 0; i < 10; i++) {
    // At i = 5, the list length would exceed its capacity, so the list grows
    nums.add(i);
  }
  print(
      'After increasing capacity, nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}');
}
