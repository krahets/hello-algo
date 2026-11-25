/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 리스트 클래스 */
class MyList {
  late List<int> _arr; // 배열(리스트 원소 저장)
  int _capacity = 10; // 리스트 용량
  int _size = 0; // 리스트 길이(현재 원소 수)
  int _extendRatio = 2; // 리스트 용량을 늘릴 때마다 적용하는 배수

  /* 생성자 */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* 리스트 길이(현재 원소 수) 구하기*/
  int size() => _size;

  /* 리스트 용량 구하기 */
  int capacity() => _capacity;

  /* 원소 접근 */
  int get(int index) {
    if (index >= _size) throw RangeError('인덱스 범위 초과');
    return _arr[index];
  }

  /* 원소 갱신 */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('인덱스 범위 초과');
    _arr[index] = _num;
  }

  /* 맨 뒤에 원소 추가 */
  void add(int _num) {
    // 원소 수가 용량을 초과하면 용량을 늘린다.
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // 원소 수 갱신
    _size++;
  }

  /* 중간에 원소 삽입 */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('인덱스 범위 초과');
    // 원소 수가 용량을 초과하면 용량을 늘린다.
    if (_size == _capacity) extendCapacity();
    // 인덱스 index부터 끝까지 원소를 뒤로 한 칸씩 이동
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // 원소 수 갱신
    _size++;
  }

  /* 원소 삭제 */
  int remove(int index) {
    if (index >= _size) throw RangeError('인덱스 범위 초과');
    int _num = _arr[index];
    // 인덱스 index 다음의 원소를 모두 앞으로 한 칸씩 이동
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // 원소 수 갱신
    _size--;
    // 삭제한 원소 반환
    return _num;
  }

  /* 리스트 용량 늘리기 */
  void extendCapacity() {
    // 원래 배열 길이의 _extendRatio배인 새 배열 생성
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // 원래 배열을 새 배열에 복사
    List.copyRange(_newNums, 0, _arr);
    // _arr의 참조 갱신
    _arr = _newNums;
    // 리스트 용량 갱신
    _capacity = _arr.length;
  }

  /* 리스트를 배열로 변환 */
  List<int> toArray() {
    List<int> arr = [];
    for (var i = 0; i < _size; i++) {
      arr.add(get(i));
    }
    return arr;
  }
}

/* 실행 예제 */
void main() {
  /* 리스트 초기화 */
  MyList nums = MyList();
  /* 맨 뒤에 원소 추가 */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print(
      '리스트 nums = ${nums.toArray()}, 용량 = ${nums.capacity()}, 길이 = ${nums.size()}');

  /* 중간에 원소 삽입 */
  nums.insert(3, 6);
  print('인덱스 3에 숫자 6을 삽입한 후 nums = ${nums.toArray()}');

  /* 원소 삭제 */
  nums.remove(3);
  print('인덱스 3의 원소를 삭제한 후 nums = ${nums.toArray()}');

  /* 원소 접근 */
  int _num = nums.get(1);
  print('인덱스 1의 원소를 읽은 결과 _num = $_num');

  /* 원소 갱신 */
  nums.set(1, 0);
  print('인덱스 1의 원소를 0으로 바꾼 후 nums = ${nums.toArray()}');

  /* 용량 확장 동작 테스트 */
  for (var i = 0; i < 10; i++) {
    // i = 5일 때 리스트 길이가 용량을 초과하게 되어 용량 확장이 일어난다.
    nums.add(i);
  }
  print(
      '용량 확장 후 리스트 nums = ${nums.toArray()}, 용량 = ${nums.capacity()}, 길이 = ${nums.size()}');
}
