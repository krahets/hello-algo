/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Using heap to find the largest k elements in an array */
MinHeap topKHeap(List<int> nums, int k) {
  // Initialize a min-heap and push the first k elements of the array into the heap
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // From the k+1th element, keep the heap length as k
  for (int i = k; i < nums.length; i++) {
    // If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
    if (nums[i] > heap.peek()) {
      heap.pop();
      heap.push(nums[i]);
    }
  }
  return heap;
}

/* Driver Code */
void main() {
  List<int> nums = [1, 7, 6, 3, 2];
  int k = 3;

  MinHeap res = topKHeap(nums, k);
  print("The largest $k elements are");
  res.print();
}

/* Min-heap */
class MinHeap {
  late List<int> _minHeap;

  /* Constructor, build heap based on input list */
  MinHeap(List<int> nums) {
    // Add all list elements into the heap
    _minHeap = nums;
    // Heapify all nodes except leaves
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* Return elements from the heap */
  List<int> getHeap() {
    return _minHeap;
  }

  /* Get index of left child node */
  int _left(int i) {
    return 2 * i + 1;
  }

  /* Get index of right child node */
  int _right(int i) {
    return 2 * i + 2;
  }

  /* Get index of parent node */
  int _parent(int i) {
    return (i - 1) ~/ 2; // Integer division down
  }

  /* Swap elements */
  void _swap(int i, int j) {
    int tmp = _minHeap[i];
    _minHeap[i] = _minHeap[j];
    _minHeap[j] = tmp;
  }

  /* Get heap size */
  int size() {
    return _minHeap.length;
  }

  /* Determine if heap is empty */
  bool isEmpty() {
    return size() == 0;
  }

  /* Access heap top element */
  int peek() {
    return _minHeap[0];
  }

  /* Push the element into heap */
  void push(int val) {
    // Add node
    _minHeap.add(val);
    // Heapify from bottom to top
    siftUp(size() - 1);
  }

  /* Start heapifying node i, from bottom to top */
  void siftUp(int i) {
    while (true) {
      // Get parent node of node i
      int p = _parent(i);
      // When "crossing the root node" or "node does not need repair", end heapification
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
        break;
      }
      // Swap two nodes
      _swap(i, p);
      // Loop upwards heapification
      i = p;
    }
  }

  /* Element exits heap */
  int pop() {
    // Empty handling
    if (isEmpty()) throw Exception('堆为空');
    // Swap the root node with the rightmost leaf node (swap the first element with the last element)
    _swap(0, size() - 1);
    // Remove node
    int val = _minHeap.removeLast();
    // Heapify from top to bottom
    siftDown(0);
    // Return heap top element
    return val;
  }

  /* Start heapifying node i, from top to bottom */
  void siftDown(int i) {
    while (true) {
      // Determine the largest node among i, l, r, noted as ma
      int l = _left(i);
      int r = _right(i);
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
      if (mi == i) break;
      // Swap two nodes
      _swap(i, mi);
      // Loop downwards heapification
      i = mi;
    }
  }

  /* Print heap (binary tree) */
  void print() {
    printHeap(_minHeap);
  }
}
