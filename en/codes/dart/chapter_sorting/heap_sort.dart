/**
 * File: heap_sort.dart
 * Created Time: 2023-06-01
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Sift down from node i in a heap of size n */
void siftDown(List<int> nums, int n, int i) {
  while (true) {
    // Let ma be the index of the largest of nodes i, l, and r
    int l = 2 * i + 1;
    int r = 2 * i + 2;
    int ma = i;
    if (l < n && nums[l] > nums[ma]) ma = l;
    if (r < n && nums[r] > nums[ma]) ma = r;
    // Stop if i is the largest or both child indices l and r are out of bounds
    if (ma == i) break;
    // Swap the two nodes
    int temp = nums[i];
    nums[i] = nums[ma];
    nums[ma] = temp;
    // Continue sifting down
    i = ma;
  }
}

/* Heap sort */
void heapSort(List<int> nums) {
  // Build the heap by sifting down from each non-leaf node
  for (int i = nums.length ~/ 2 - 1; i >= 0; i--) {
    siftDown(nums, nums.length, i);
  }
  // Extract the maximum from the heap in each of n-1 rounds
  for (int i = nums.length - 1; i > 0; i--) {
    // Swap the root and rightmost leaf (the first and last elements)
    int tmp = nums[0];
    nums[0] = nums[i];
    nums[i] = tmp;
    // Sift down from the root
    siftDown(nums, i, 0);
  }
}

/* Driver Code */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  heapSort(nums);
  print("After heap sort, nums = $nums");
}
