/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* Max heap */
typedef struct {
    // size is the actual number of elements
    int size;
    // Use a preallocated array to avoid resizing
    int data[MAX_SIZE];
} MaxHeap;

// Function declaration
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* Constructor: build a heap from the input array */
MaxHeap *newMaxHeap(int nums[], int size) {
    // Place all elements in the heap
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // Sift down from every non-leaf node
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* Destructor */
void delMaxHeap(MaxHeap *maxHeap) {
    // Free memory
    free(maxHeap);
}

/* Get the left child index */
int left(MaxHeap *maxHeap, int i) {
    return 2 * i + 1;
}

/* Get the right child index */
int right(MaxHeap *maxHeap, int i) {
    return 2 * i + 2;
}

/* Get the parent index */
int parent(MaxHeap *maxHeap, int i) {
    return (i - 1) / 2; // Integer division truncates toward zero
}

/* Swap elements */
void swap(MaxHeap *maxHeap, int i, int j) {
    int temp = maxHeap->data[i];
    maxHeap->data[i] = maxHeap->data[j];
    maxHeap->data[j] = temp;
}

/* Get the heap size */
int size(MaxHeap *maxHeap) {
    return maxHeap->size;
}

/* Check whether the heap is empty */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* Access the top element of the heap */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* Push an element onto the heap */
void push(MaxHeap *maxHeap, int val) {
    // Normally, the number of nodes should remain below this limit
    if (maxHeap->size == MAX_SIZE) {
        printf("Heap is full!");
        return;
    }
    // Add a node
    maxHeap->data[maxHeap->size] = val;
    maxHeap->size++;

    // Sift up
    siftUp(maxHeap, maxHeap->size - 1);
}

/* Pop an element from the heap */
int pop(MaxHeap *maxHeap) {
    // Handle an empty heap
    if (isEmpty(maxHeap)) {
        printf("Heap is empty!");
        return INT_MAX;
    }
    // Swap the root with the rightmost leaf on the last level (swap the first and last elements)
    swap(maxHeap, 0, size(maxHeap) - 1);
    // Remove a node
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // Sift down
    siftDown(maxHeap, 0);

    // Return the top element of the heap
    return val;
}

/* Sift down starting from node i */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // Find the node with the largest value among i, l, and r, and store its index in max
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // Stop if node i is largest or both child indices l and r are out of bounds
        if (max == i) {
            break;
        }
        // Swap the two nodes
        swap(maxHeap, i, max);
        // Continue sifting down
        i = max;
    }
}

/* Sift up starting from node i */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // Get the parent of node i
        int p = parent(maxHeap, i);
        // Stop sifting when the root has been passed or the node needs no repair
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // Swap the two nodes
        swap(maxHeap, i, p);
        // Continue sifting up
        i = p;
    }
}
