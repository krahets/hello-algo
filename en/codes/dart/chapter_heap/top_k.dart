/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Find the largest k elements in array based on heap */
MinHeap topKHeap(List<int> nums, int k) {
  // Initialize min heap, push first k elements of array to heap
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // Starting from the (k+1)th element, maintain heap length as k
  for (int i = k; i < nums.length; i++) {
    // If current element is greater than top element, top element exits heap, current element enters heap
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

/* Min heap */
class MinHeap {
  late List<int> _minHeap;

  /* Constructor, build heap based on input list */
  MinHeap(List<int> nums) {
    // Add list elements to heap as is
    _minHeap = nums;
    // Heapify all nodes except leaf nodes
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* Return elements in heap */
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
    return (i - 1) ~/ 2; // Floor division
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

  /* Check if heap is empty */
  bool isEmpty() {
    return size() == 0;
  }

  /* Access top element */
  int peek() {
    return _minHeap[0];
  }

  /* Element enters heap */
  void push(int val) {
    // Add node
    _minHeap.add(val);
    // Heapify from bottom to top
    siftUp(size() - 1);
  }

  /* Starting from node i, heapify from bottom to top */
  void siftUp(int i) {
    while (true) {
      // Get parent node of node i
      int p = _parent(i);
      // When "crossing root node" or "node needs no repair", end heapify
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
        break;
      }
      // Swap two nodes
      _swap(i, p);
      // Loop upward heapify
      i = p;
    }
  }

  /* Element exits heap */
  int pop() {
    // Handle empty case
    if (isEmpty()) throw Exception('Heap is empty');
    // Delete node
    _swap(0, size() - 1);
    // Remove node
    int val = _minHeap.removeLast();
    // Return top element
    siftDown(0);
    // Return heap top element
    return val;
  }

  /* Starting from node i, heapify from top to bottom */
  void siftDown(int i) {
    while (true) {
      // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
      int l = _left(i);
      int r = _right(i);
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // Swap two nodes
      if (mi == i) break;
      // Swap two nodes
      _swap(i, mi);
      // Loop downwards heapification
      i = mi;
    }
  }

  /* Driver Code */
  void print() {
    printHeap(_minHeap);
  }
}
