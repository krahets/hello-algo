/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Max-heap */
class MaxHeap {
  late List<int> _maxHeap;

  /* Constructor, build heap based on input list */
  MaxHeap(List<int> nums) {
    // Add all list elements into the heap
    _maxHeap = nums;
    // Heapify all nodes except leaves
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
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
    int tmp = _maxHeap[i];
    _maxHeap[i] = _maxHeap[j];
    _maxHeap[j] = tmp;
  }

  /* Get heap size */
  int size() {
    return _maxHeap.length;
  }

  /* Determine if heap is empty */
  bool isEmpty() {
    return size() == 0;
  }

  /* Access heap top element */
  int peek() {
    return _maxHeap[0];
  }

  /* Push the element into heap */
  void push(int val) {
    // Add node
    _maxHeap.add(val);
    // Heapify from bottom to top
    siftUp(size() - 1);
  }

  /* Start heapifying node i, from bottom to top */
  void siftUp(int i) {
    while (true) {
      // Get parent node of node i
      int p = _parent(i);
      // When "crossing the root node" or "node does not need repair", end heapification
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
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
    int val = _maxHeap.removeLast();
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
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
      if (ma == i) break;
      // Swap two nodes
      _swap(i, ma);
      // Loop downwards heapification
      i = ma;
    }
  }

  /* Print heap (binary tree) */
  void print() {
    printHeap(_maxHeap);
  }
}

/* Driver Code */
void main() {
  /* Initialize max-heap */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\nEnter list and build heap");
  maxHeap.print();

  /* Access heap top element */
  int peek = maxHeap.peek();
  print("\nTop element of the heap is $peek");

  /* Push the element into heap */
  int val = 7;
  maxHeap.push(val);
  print("\nElement $val after being pushed to the heap");
  maxHeap.print();

  /* Pop the element at the heap top */
  peek = maxHeap.pop();
  print("\nTop element $peek after being popped from the heap");
  maxHeap.print();

  /* Get heap size */
  int size = maxHeap.size();
  print("\nNumber of elements in the heap = $size");

  /* Determine if heap is empty */
  bool isEmpty = maxHeap.isEmpty();
  print("\nIs the heap empty = $isEmpty");
}
