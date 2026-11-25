/**
 * File: worst_best_time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Generate a shuffled array containing { 1, 2, ..., n } */
List<int> randomNumbers(int n) {
  final nums = List.filled(n, 0);
  // Generate the array nums = { 1, 2, 3, ..., n }
  for (var i = 0; i < n; i++) {
    nums[i] = i + 1;
  }
  // Shuffle the array elements at random
  nums.shuffle();

  return nums;
}

/* Find the index of 1 in the array nums */
int findOne(List<int> nums) {
  for (var i = 0; i < nums.length; i++) {
    // Best case: 1 is the first element, so the search takes O(1) time
    // Worst case: 1 is the last element, so the search takes O(n) time
    if (nums[i] == 1) return i;
  }

  return -1;
}

/* Driver Code */
void main() {
  for (var i = 0; i < 10; i++) {
    int n = 100;
    final nums = randomNumbers(n);
    int index = findOne(nums);
    print('\nShuffled array [ 1, 2, ..., n ] = $nums');
    print('Index of 1: + $index');
  }
}
