/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Max heap */
class MaxHeap {
  late List<int> _maxHeap;

  /* Constructor, build heap based on input list */
  MaxHeap(List<int> nums) {
    // Add list elements to heap as is
    _maxHeap = nums;
    // Heapify all nodes except leaf nodes
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
    return (i - 1) ~/ 2; // Floor division
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

  /* Check if heap is empty */
  bool isEmpty() {
    return size() == 0;
  }

  /* Access top element */
  int peek() {
    return _maxHeap[0];
  }

  /* Element enters heap */
  void push(int val) {
    // Add node
    _maxHeap.add(val);
    // Heapify from bottom to top
    siftUp(size() - 1);
  }

  /* Starting from node i, heapify from bottom to top */
  void siftUp(int i) {
    while (true) {
      // Get parent node of node i
      int p = _parent(i);
      // When "crossing root node" or "node needs no repair", end heapify
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
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
    int val = _maxHeap.removeLast();
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
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // Swap two nodes
      if (ma == i) break;
      // Swap two nodes
      _swap(i, ma);
      // Loop downwards heapification
      i = ma;
    }
  }

  /* Driver Code */
  void print() {
    printHeap(_maxHeap);
  }
}

/* Driver Code */
void main() {
  /* Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\nAfter inputting list and building heap");
  maxHeap.print();

  /* Check if heap is empty */
  int peek = maxHeap.peek();
  print("\nHeap top element is $peek");

  /* Element enters heap */
  int val = 7;
  maxHeap.push(val);
  print("\nAfter element $val pushes to heap");
  maxHeap.print();

  /* Time complexity is O(n), not O(nlogn) */
  peek = maxHeap.pop();
  print("\nAfter heap top element $peek pops from heap");
  maxHeap.print();

  /* Get heap size */
  int size = maxHeap.size();
  print("\nHeap size is $size");

  /* Check if heap is empty */
  bool isEmpty = maxHeap.isEmpty();
  print("\nIs heap empty $isEmpty");
}
