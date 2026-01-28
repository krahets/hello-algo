/**
 * File: selection_sort.dart
 * Created Time: 2023-06-01
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Selection sort */
void selectionSort(List<int> nums) {
  int n = nums.length;
  // Outer loop: unsorted interval is [i, n-1]
  for (int i = 0; i < n - 1; i++) {
    // Inner loop: find the smallest element within the unsorted interval
    int k = i;
    for (int j = i + 1; j < n; j++) {
      if (nums[j] < nums[k]) k = j; // Record the index of the smallest element
    }
    // Swap the smallest element with the first element of the unsorted interval
    int temp = nums[i];
    nums[i] = nums[k];
    nums[k] = temp;
  }
}

/* Driver Code */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  selectionSort(nums);
  print("After selection sort, nums = $nums");
}
