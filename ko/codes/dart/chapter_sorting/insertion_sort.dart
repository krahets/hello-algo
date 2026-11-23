/**
 * File: insertion_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* 삽입 정렬 */
void insertionSort(List<int> nums) {
  // 바깥쪽 반복문: 정렬된 구간은 [0, i-1]이다
  for (int i = 1; i < nums.length; i++) {
    int base = nums[i], j = i - 1;
    // 안쪽 반복문: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입한다
    while (j >= 0 && nums[j] > base) {
      nums[j + 1] = nums[j]; // nums[j]를 오른쪽으로 한 칸 이동한다
      j--;
    }
    nums[j + 1] = base; // 올바른 위치에 base를 대입한다
  }
}

/* 실행 코드 */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  insertionSort(nums);
  print("삽입 정렬 후 nums = $nums");
}
