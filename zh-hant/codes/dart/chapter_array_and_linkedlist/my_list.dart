/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 串列類別 */
class MyList {
  late List<int> _arr; // 陣列（儲存串列元素）
  int _capacity = 10; // 串列容量
  int _size = 0; // 串列長度（當前元素數量）
  int _extendRatio = 2; // 每次串列擴容的倍數

  /* 建構子 */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* 獲取串列長度（當前元素數量）*/
  int size() => _size;

  /* 獲取串列容量 */
  int capacity() => _capacity;

  /* 訪問元素 */
  int get(int index) {
    if (index >= _size) throw RangeError('索引越界');
    return _arr[index];
  }

  /* 更新元素 */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('索引越界');
    _arr[index] = _num;
  }

  /* 在尾部新增元素 */
  void add(int _num) {
    // 元素數量超出容量時，觸發擴容機制
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // 更新元素數量
    _size++;
  }

  /* 在中間插入元素 */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('索引越界');
    // 元素數量超出容量時，觸發擴容機制
    if (_size == _capacity) extendCapacity();
    // 將索引 index 以及之後的元素都向後移動一位
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // 更新元素數量
    _size++;
  }

  /* 刪除元素 */
  int remove(int index) {
    if (index >= _size) throw RangeError('索引越界');
    int _num = _arr[index];
    // 將將索引 index 之後的元素都向前移動一位
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // 更新元素數量
    _size--;
    // 返回被刪除的元素
    return _num;
  }

  /* 串列擴容 */
  void extendCapacity() {
    // 新建一個長度為原陣列 _extendRatio 倍的新陣列
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // 將原陣列複製到新陣列
    List.copyRange(_newNums, 0, _arr);
    // 更新 _arr 的引用
    _arr = _newNums;
    // 更新串列容量
    _capacity = _arr.length;
  }

  /* 將串列轉換為陣列 */
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
  /* 初始化串列 */
  MyList nums = MyList();
  /* 在尾部新增元素 */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print(
      '串列 nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，長度 = ${nums.size()}');

  /* 在中間插入元素 */
  nums.insert(3, 6);
  print('在索引 3 處插入數字 6 ，得到 nums = ${nums.toArray()}');

  /* 刪除元素 */
  nums.remove(3);
  print('刪除索引 3 處的元素，得到 nums = ${nums.toArray()}');

  /* 訪問元素 */
  int _num = nums.get(1);
  print('訪問索引 1 處的元素，得到 _num = $_num');

  /* 更新元素 */
  nums.set(1, 0);
  print('將索引 1 處的元素更新為 0 ，得到 nums = ${nums.toArray()}');

  /* 測試擴容機制 */
  for (var i = 0; i < 10; i++) {
    // 在 i = 5 時，串列長度將超出串列容量，此時觸發擴容機制
    nums.add(i);
  }
  print(
      '擴容後的串列 nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，長度 = ${nums.size()}');
}
