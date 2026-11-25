/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Find the k largest elements in the array using a heap */
MinHeap topKHeap(List<int> nums, int k) {
  // Initialize a min-heap and push the first k elements of the array onto it
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // Starting with element k+1, keep the heap size at k
  for (int i = k; i < nums.length; i++) {
    // If the current element exceeds the root, pop the root and push the current element
    if (nums[i] > heap.peek()) {
      heap.pop();
      heap.push(nums[i]);
    }
  }
  return heap;
}

/* Driver code */
void main() {
  List<int> nums = [1, 7, 6, 3, 2];
  int k = 3;

  MinHeap res = topKHeap(nums, k);
  print("The $k largest elements are:");
  res.print();
}

/* Min-heap */
class MinHeap {
  late List<int> _minHeap;

  /* Constructor: build a heap from the input list */
  MinHeap(List<int> nums) {
    // Copy the list elements into the heap in their original order
    _minHeap = nums;
    // Heapify all non-leaf nodes
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* Return the elements in the heap */
  List<int> getHeap() {
    return _minHeap;
  }

  /* Get the left child index */
  int _left(int i) {
    return 2 * i + 1;
  }

  /* Get the right child index */
  int _right(int i) {
    return 2 * i + 2;
  }

  /* Get the parent index */
  int _parent(int i) {
    return (i - 1) ~/ 2; // Floor division
  }

  /* Swap elements */
  void _swap(int i, int j) {
    int tmp = _minHeap[i];
    _minHeap[i] = _minHeap[j];
    _minHeap[j] = tmp;
  }

  /* Get the heap size */
  int size() {
    return _minHeap.length;
  }

  /* Check whether the heap is empty */
  bool isEmpty() {
    return size() == 0;
  }

  /* Peek at the root */
  int peek() {
    return _minHeap[0];
  }

  /* Push an element onto the heap */
  void push(int val) {
    // Add a node
    _minHeap.add(val);
    // Sift up
    siftUp(size() - 1);
  }

  /* Sift up from node i */
  void siftUp(int i) {
    while (true) {
      // Get the parent of node i
      int p = _parent(i);
      // Stop sifting at the root or when the node already satisfies the heap property
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
        break;
      }
      // Swap the two nodes
      _swap(i, p);
      // Continue sifting up
      i = p;
    }
  }

  /* Pop an element from the heap */
  int pop() {
    // Handle an empty heap
    if (isEmpty()) throw Exception('Heap is empty');
    // Swap the root and the rightmost leaf (the first and last elements)
    _swap(0, size() - 1);
    // Remove the node
    int val = _minHeap.removeLast();
    // Sift down
    siftDown(0);
    // Return the root element
    return val;
  }

  /* Sift down from node i */
  void siftDown(int i) {
    while (true) {
      // Store the index of the largest of nodes i, l, and r in ma
      int l = _left(i);
      int r = _right(i);
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // Stop if i is already largest or both child indices l and r are out of bounds
      if (mi == i) break;
      // Swap the two nodes
      _swap(i, mi);
      // Continue sifting down
      i = mi;
    }
  }

  /* Print the heap as a binary tree */
  void print() {
    printHeap(_minHeap);
  }
}
