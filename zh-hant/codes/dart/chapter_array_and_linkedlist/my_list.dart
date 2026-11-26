/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 列表類別 */
class MyList {
  late List<int> _arr; // 陣列（用來儲存列表元素）
  int _capacity = 10; // 列表容量
  int _size = 0; // 列表長度（目前的元素數量）
  int _extendRatio = 2; // 每次擴充列表容量的倍數

  /* 建構方法 */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* 取得列表長度（目前的元素數量）*/
  int size() => _size;

  /* 取得列表容量 */
  int capacity() => _capacity;

  /* 存取元素 */
  int get(int index) {
    if (index >= _size) throw RangeError('索引超出範圍');
    return _arr[index];
  }

  /* 更新元素 */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('索引超出範圍');
    _arr[index] = _num;
  }

  /* 在尾端加入元素 */
  void add(int _num) {
    // 若加入元素後數量將超過容量，就觸發擴充機制
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // 更新元素數量
    _size++;
  }

  /* 在中間插入元素 */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('索引超出範圍');
    // 若加入元素後數量將超過容量，就觸發擴充機制
    if (_size == _capacity) extendCapacity();
    // 將索引 index 起的所有元素往後移一格
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // 更新元素數量
    _size++;
  }

  /* 刪除元素 */
  int remove(int index) {
    if (index >= _size) throw RangeError('索引超出範圍');
    int _num = _arr[index];
    // 將索引 index 之後的所有元素往前移一格
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // 更新元素數量
    _size--;
    // 回傳刪除的元素
    return _num;
  }

  /* 擴充列表容量 */
  void extendCapacity() {
    // 建立新陣列，長度為原陣列的 _extendRatio 倍
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // 將原陣列的內容複製到新陣列
    List.copyRange(_newNums, 0, _arr);
    // 更新 _arr 的參照
    _arr = _newNums;
    // 更新列表容量
    _capacity = _arr.length;
  }

  /* 將列表轉為陣列 */
  List<int> toArray() {
    List<int> arr = [];
    for (var i = 0; i < _size; i++) {
      arr.add(get(i));
    }
    return arr;
  }
}

/* 範例主程式 */
void main() {
  /* 初始化列表 */
  MyList nums = MyList();
  /* 在尾端加入元素 */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print(
      '列表 nums = ${nums.toArray()}，容量 = ${nums.capacity()}，長度 = ${nums.size()}');

  /* 在中間插入元素 */
  nums.insert(3, 6);
  print('在索引 3 處插入數字 6，得到 nums = ${nums.toArray()}');

  /* 刪除元素 */
  nums.remove(3);
  print('刪除索引 3 處的元素，得到 nums = ${nums.toArray()}');

  /* 存取元素 */
  int _num = nums.get(1);
  print('存取索引 1 處的元素，得到 _num = $_num');

  /* 更新元素 */
  nums.set(1, 0);
  print('將索引 1 處的元素更新為 0，得到 nums = ${nums.toArray()}');

  /* 測試容量擴充機制 */
  for (var i = 0; i < 10; i++) {
    // 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
    nums.add(i);
  }
  print(
      '擴充後的列表 nums = ${nums.toArray()}，容量 = ${nums.capacity()}，長度 = ${nums.size()}');
}
