/**
 * File: selection_sort.dart
 * Created Time: 2023-06-01
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 선택 정렬 */
void selectionSort(List<int> nums) {
  int n = nums.length;
  // 바깥 루프: 미정렬 구간은 [i, n-1]
  for (int i = 0; i < n - 1; i++) {
    // 안쪽 루프: 미정렬 구간에서 최솟값 찾기
    int k = i;
    for (int j = i + 1; j < n; j++) {
      if (nums[j] < nums[k]) k = j; // 최솟값의 인덱스 기록
    }
    // 최솟값과 미정렬 구간의 첫 원소 교환
    int temp = nums[i];
    nums[i] = nums[k];
    nums[k] = temp;
  }
}

/* 실행 예제 */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  selectionSort(nums);
  print("선택 정렬 후 nums = $nums");
}
