/**
 * File: worst_best_time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Generate an array containing { 1, 2, ..., n } in shuffled order */
List<int> randomNumbers(int n) {
  final nums = List.filled(n, 0);
  // Generate the array nums = { 1, 2, 3, ..., n }
  for (var i = 0; i < n; i++) {
    nums[i] = i + 1;
  }
  // Randomly shuffle the array elements
  nums.shuffle();

  return nums;
}

/* Find the index of the number 1 in array nums */
int findOne(List<int> nums) {
  for (var i = 0; i < nums.length; i++) {
    // When 1 is at the start of the array, the best-case time complexity is O(1)
    // When 1 is at the end of the array, the worst-case time complexity is O(n)
    if (nums[i] == 1) return i;
  }

  return -1;
}

/* Driver code */
void main() {
  for (var i = 0; i < 10; i++) {
    int n = 100;
    final nums = randomNumbers(n);
    int index = findOne(nums);
    print('\nArray [ 1, 2, ..., n ] after shuffling = $nums');
    print('Index of 1 = + $index');
  }
}
