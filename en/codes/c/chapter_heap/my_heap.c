/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* Max-heap */
typedef struct {
    // size is the actual number of elements
    int size;
    // Use a preallocated array to avoid resizing
    int data[MAX_SIZE];
} MaxHeap;

// Function declarations
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* Constructor: build a heap from a slice */
MaxHeap *newMaxHeap(int nums[], int size) {
    // Push all elements onto the heap
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // Heapify all non-leaf nodes
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* Destructor */
void delMaxHeap(MaxHeap *maxHeap) {
    // Free the memory
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
    return (i - 1) / 2; // Round down
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

/* Peek at the root */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* Push an element onto the heap */
void push(MaxHeap *maxHeap, int val) {
    // The default capacity should be enough for the expected number of nodes
    if (maxHeap->size == MAX_SIZE) {
        printf("heap is full!");
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
        printf("heap is empty!");
        return INT_MAX;
    }
    // Swap the root and the rightmost leaf (the first and last elements)
    swap(maxHeap, 0, size(maxHeap) - 1);
    // Remove the node
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // Sift down
    siftDown(maxHeap, 0);

    // Return the root element
    return val;
}

/* Sift down from node i */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // Store the index of the largest of nodes i, l, and r in max
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // Stop if i is already largest or both child indices l and r are out of bounds
        if (max == i) {
            break;
        }
        // Swap the two nodes
        swap(maxHeap, i, max);
        // Continue sifting down
        i = max;
    }
}

/* Sift up from node i */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // Get the parent of node i
        int p = parent(maxHeap, i);
        // Stop sifting at the root or when the node already satisfies the heap property
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // Swap the two nodes
        swap(maxHeap, i, p);
        // Continue sifting up
        i = p;
    }
}
