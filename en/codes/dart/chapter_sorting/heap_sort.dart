/**
 * File: heap_sort.dart
 * Created Time: 2023-06-01
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Heap length is n, start heapifying node i, from top to bottom */
void siftDown(List<int> nums, int n, int i) {
  while (true) {
    // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
    int l = 2 * i + 1;
    int r = 2 * i + 2;
    int ma = i;
    if (l < n && nums[l] > nums[ma]) ma = l;
    if (r < n && nums[r] > nums[ma]) ma = r;
    // Swap two nodes
    if (ma == i) break;
    // Swap two nodes
    int temp = nums[i];
    nums[i] = nums[ma];
    nums[ma] = temp;
    // Loop downwards heapification
    i = ma;
  }
}

/* Heap sort */
void heapSort(List<int> nums) {
  // Build heap operation: heapify all nodes except leaves
  for (int i = nums.length ~/ 2 - 1; i >= 0; i--) {
    siftDown(nums, nums.length, i);
  }
  // Extract the largest element from the heap and repeat for n-1 rounds
  for (int i = nums.length - 1; i > 0; i--) {
    // Delete node
    int tmp = nums[0];
    nums[0] = nums[i];
    nums[i] = tmp;
    // Start heapifying the root node, from top to bottom
    siftDown(nums, i, 0);
  }
}

/* Driver Code */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  heapSort(nums);
  print("After heap sort, nums = $nums");
}
