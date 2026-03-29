/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* リストクラス */
class MyList {
  late List<int> _arr; // 配列（リスト要素を格納）
  int _capacity = 10; // リスト容量
  int _size = 0; // リストの長さ（現在の要素数）
  int _extendRatio = 2; // リスト拡張時の増加倍率

  /* コンストラクタ */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* リストの長さを取得（現在の要素数） */
  int size() => _size;

  /* リスト容量を取得する */
  int capacity() => _capacity;

  /* 要素にアクセス */
  int get(int index) {
    if (index >= _size) throw RangeError('インデックスが範囲外です');
    return _arr[index];
  }

  /* 要素を更新 */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('インデックスが範囲外です');
    _arr[index] = _num;
  }

  /* 末尾に要素を追加 */
  void add(int _num) {
    // 要素数が容量を超えると、拡張機構が発動する
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // 要素数を更新
    _size++;
  }

  /* 中間に要素を挿入 */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('インデックスが範囲外です');
    // 要素数が容量を超えると、拡張機構が発動する
    if (_size == _capacity) extendCapacity();
    // index 以降の要素をすべて 1 つ後ろへずらす
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // 要素数を更新
    _size++;
  }

  /* 要素を削除 */
  int remove(int index) {
    if (index >= _size) throw RangeError('インデックスが範囲外です');
    int _num = _arr[index];
    // インデックス index より後の要素をすべて 1 つ前に移動する
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // 要素数を更新
    _size--;
    // 削除された要素を返す
    return _num;
  }

  /* リストの拡張 */
  void extendCapacity() {
    // 元の配列の `_extendRatio` 倍の長さを持つ新しい配列を作成する
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // 元の配列を新しい配列にコピー
    List.copyRange(_newNums, 0, _arr);
    // `_arr` の参照を更新
    _arr = _newNums;
    // リストの容量を更新
    _capacity = _arr.length;
  }

  /* リストを配列に変換する */
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
  /* リストを初期化 */
  MyList nums = MyList();
  /* 末尾に要素を追加 */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print(
      'リスト nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，長さ = ${nums.size()}');

  /* 中間に要素を挿入 */
  nums.insert(3, 6);
  print('インデックス 3 に数字 6 を挿入し、nums = ${nums.toArray()} を取得');

  /* 要素を削除 */
  nums.remove(3);
  print('インデックス 3 の要素を削除し、nums = ${nums.toArray()} を取得');

  /* 要素にアクセス */
  int _num = nums.get(1);
  print('インデックス 1 の要素にアクセスし、_num = $_num を取得');

  /* 要素を更新 */
  nums.set(1, 0);
  print('インデックス 1 の要素を 0 に更新し、nums = ${nums.toArray()} を取得');

  /* 拡張機構をテストする */
  for (var i = 0; i < 10; i++) {
    // i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
    nums.add(i);
  }
  print(
      '容量拡張後のリスト nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，長さ = ${nums.size()}');
}
