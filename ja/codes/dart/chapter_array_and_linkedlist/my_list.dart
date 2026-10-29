/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* リストクラス */
class MyList {
  late List<int> _arr; // 配列（リストの要素を格納する）
  int _capacity = 10; // リストの容量
  int _size = 0; // リストの長さ（現在の要素数）
  int _extendRatio = 2; // リストの容量を拡張する際の倍率

  /* コンストラクタ */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* リストの長さ（現在の要素数）を取得する*/
  int size() => _size;

  /* リストの容量を取得する */
  int capacity() => _capacity;

  /* 要素にアクセスする */
  int get(int index) {
    if (index >= _size) throw RangeError('インデックスが範囲外です');
    return _arr[index];
  }

  /* 要素を更新する */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('インデックスが範囲外です');
    _arr[index] = _num;
  }

  /* 末尾に要素を追加する */
  void add(int _num) {
    // 要素数が容量を超える場合、容量を拡張する
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // 要素数を更新する
    _size++;
  }

  /* 途中に要素を挿入する */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('インデックスが範囲外です');
    // 要素数が容量を超える場合、容量を拡張する
    if (_size == _capacity) extendCapacity();
    // インデックス index 以降の全要素を後ろに 1 つずらす
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // 要素数を更新する
    _size++;
  }

  /* 要素を削除する */
  int remove(int index) {
    if (index >= _size) throw RangeError('インデックスが範囲外です');
    int _num = _arr[index];
    // インデックス index より後の全要素を前に 1 つずらす
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // 要素数を更新する
    _size--;
    // 削除した要素を返す
    return _num;
  }

  /* リストの容量を拡張する */
  void extendCapacity() {
    // 元の配列の _extendRatio 倍の長さの新しい配列を作成する
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // 元の配列を新しい配列にコピーする
    List.copyRange(_newNums, 0, _arr);
    // _arr の参照を更新する
    _arr = _newNums;
    // リストの容量を更新する
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

/* 実行用コード */
void main() {
  /* リストを初期化する */
  MyList nums = MyList();
  /* 末尾に要素を追加する */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print(
      'リスト nums = ${nums.toArray()} 、容量 = ${nums.capacity()} 、長さ = ${nums.size()}');

  /* 途中に要素を挿入する */
  nums.insert(3, 6);
  print('インデックス 3 に数値 6 を挿入した結果 nums = ${nums.toArray()}');

  /* 要素を削除する */
  nums.remove(3);
  print('インデックス 3 の要素を削除した結果 nums = ${nums.toArray()}');

  /* 要素にアクセスする */
  int _num = nums.get(1);
  print('インデックス 1 の要素にアクセスした結果 _num = $_num');

  /* 要素を更新する */
  nums.set(1, 0);
  print('インデックス 1 の要素を 0 に更新した結果 nums = ${nums.toArray()}');

  /* 容量の拡張をテストする */
  for (var i = 0; i < 10; i++) {
    // i = 5 のときにリストの長さが容量を超えるため、容量が拡張される
    nums.add(i);
  }
  print(
      '容量を拡張した後のリスト nums = ${nums.toArray()} 、容量 = ${nums.capacity()} 、長さ = ${nums.size()}');
}
