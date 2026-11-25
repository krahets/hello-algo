/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Max-heap */
class MaxHeap {
  late List<int> _maxHeap;

  /* Constructor: build a heap from the input list */
  MaxHeap(List<int> nums) {
    // Copy the list elements into the heap in their original order
    _maxHeap = nums;
    // Heapify all non-leaf nodes
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
    return (i - 1) ~/ 2; // Floor division
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

  /* Peek at the root */
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

  /* Sift up from node i */
  void siftUp(int i) {
    while (true) {
      // Get the parent of node i
      int p = _parent(i);
      // Stop sifting at the root or when the node already satisfies the heap property
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
    // Swap the root and the rightmost leaf (the first and last elements)
    _swap(0, size() - 1);
    // Remove the node
    int val = _maxHeap.removeLast();
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
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // Stop if i is already largest or both child indices l and r are out of bounds
      if (ma == i) break;
      // Swap the two nodes
      _swap(i, ma);
      // Continue sifting down
      i = ma;
    }
  }

  /* Print the heap as a binary tree */
  void print() {
    printHeap(_maxHeap);
  }
}

/* Driver code */
void main() {
  /* Initialize a max-heap */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\nHeap built from the input list:");
  maxHeap.print();

  /* Get the root element */
  int peek = maxHeap.peek();
  print("\nRoot element: $peek");

  /* Push an element onto the heap */
  int val = 7;
  maxHeap.push(val);
  print("\nHeap after pushing $val:");
  maxHeap.print();

  /* Pop the root */
  peek = maxHeap.pop();
  print("\nHeap after popping the root ($peek):");
  maxHeap.print();

  /* Get the heap size */
  int size = maxHeap.size();
  print("\nNumber of elements in the heap: $size");

  /* Check whether the heap is empty */
  bool isEmpty = maxHeap.isEmpty();
  print("\nIs the heap empty? $isEmpty");
}
