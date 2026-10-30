/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Max heap */
class MaxHeap {
  late List<int> _maxHeap;

  /* Constructor: build a heap from the input list */
  MaxHeap(List<int> nums) {
    // Place the list elements in the heap without changing their order
    _maxHeap = nums;
    // Sift down from every non-leaf node
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
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
    return (i - 1) ~/ 2; // Integer division
  }

  /* Swap elements */
  void _swap(int i, int j) {
    int tmp = _maxHeap[i];
    _maxHeap[i] = _maxHeap[j];
    _maxHeap[j] = tmp;
  }

  /* Get the heap size */
  int size() {
    return _maxHeap.length;
  }

  /* Check whether the heap is empty */
  bool isEmpty() {
    return size() == 0;
  }

  /* Access the top element of the heap */
  int peek() {
    return _maxHeap[0];
  }

  /* Push an element onto the heap */
  void push(int val) {
    // Add a node
    _maxHeap.add(val);
    // Sift up
    siftUp(size() - 1);
  }

  /* Sift up starting from node i */
  void siftUp(int i) {
    while (true) {
      // Get the parent of node i
      int p = _parent(i);
      // Stop sifting when the root has been passed or the node needs no repair
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
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
    // Swap the root with the rightmost leaf on the last level (swap the first and last elements)
    _swap(0, size() - 1);
    // Remove a node
    int val = _maxHeap.removeLast();
    // Sift down
    siftDown(0);
    // Return the top element of the heap
    return val;
  }

  /* Sift down starting from node i */
  void siftDown(int i) {
    while (true) {
      // Find the node with the largest value among i, l, and r, and store its index in ma
      int l = _left(i);
      int r = _right(i);
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // Stop if node i is largest or both child indices l and r are out of bounds
      if (ma == i) break;
      // Swap the two nodes
      _swap(i, ma);
      // Continue sifting down
      i = ma;
    }
  }

  /* Print the heap (binary tree) */
  void print() {
    printHeap(_maxHeap);
  }
}

/* Driver code */
void main() {
  /* Initialize a max heap */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\nAfter building a heap from the input list:");
  maxHeap.print();

  /* Get the top element of the heap */
  int peek = maxHeap.peek();
  print("\nHeap root: $peek");

  /* Push an element onto the heap */
  int val = 7;
  maxHeap.push(val);
  print("\nAfter pushing $val onto the heap");
  maxHeap.print();

  /* Pop the top element from the heap */
  peek = maxHeap.pop();
  print("\nAfter popping root $peek from the heap");
  maxHeap.print();

  /* Get the heap size */
  int size = maxHeap.size();
  print("\nNumber of heap elements: $size");

  /* Check whether the heap is empty */
  bool isEmpty = maxHeap.isEmpty();
  print("\nIs the heap empty: $isEmpty");
}
